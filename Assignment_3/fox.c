
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <assert.h>


void print_matrix(double*,int);
void fill_matrix(double*,int,int);
void generateIdentityMatrix(double*,int);
void multiply(double*,double*,double*,int);
void generateInitialMatrices(double**, double**, double**, int);
void distributedMatrixToProcesses(double*, double*, int, int,MPI_Datatype*,  MPI_Comm, MPI_Request*);
int assertMatrices(double* , double*, int);

int main (int argc, char *argv[]) {

  int parentCommunicatorRank, numberOfProcesses;
  double start, end;

  MPI_Init(&argc, &argv);               /* initialize mpi               */
  MPI_Comm_size(MPI_COMM_WORLD, &numberOfProcesses); /* get the number of processors */
  MPI_Comm_rank(MPI_COMM_WORLD, &parentCommunicatorRank); /* Get my number                */

  if(argc < 2 && parentCommunicatorRank == 0) {
    printf("Usage: mpirun -np 4 ./fox n (where n is the matrix size)\n");
    MPI_Finalize(); 
    return -1;
  }

  if(argc < 2 && parentCommunicatorRank != 0) {
    MPI_Finalize(); 
    return -1;
  }

  double a; int b;
  a = sqrt(atoi(argv[1]));
  b = a;
  
  int n = atoi(argv[1]);

  MPI_Status stat;
  int myid, rowrank, colrank;
  MPI_Comm proc_grid, proc_row, proc_col;
  MPI_Datatype newtype;
  int i,j;
  MPI_Request request;
  MPI_Status status;

  // 2d topology
  int numberOfDimensions=2,dimensions[2]={0,0};

  // coordinates for each proc
  int coords[2];
    
  // reordering
  int reorder=1;
    
  // wrap around
  int periods[2]={0,0};

  /* Create a virtual 2D-grid topology */
  // Creates a division of processors in a cartesian grid
  MPI_Dims_create(numberOfProcesses,numberOfDimensions,dimensions);
  // Makes a new communicator to which topology information has been attached
  MPI_Cart_create(MPI_COMM_WORLD,numberOfDimensions,dimensions,periods,reorder,&proc_grid);
  // Determines the rank of the calling process in the communicator, Note: use proc_grid
  MPI_Comm_rank(proc_grid,&myid);

  // number of blocks on one row or col
  int pn = dimensions[0];
  printf("PN is %d ", pn);

  int blocksize = n*n/(pn*pn);
  double *Ab=(double *)calloc(blocksize,sizeof(double));
  double *Bb=(double *)calloc(blocksize,sizeof(double));
  double *Ab_temp=(double *)calloc(blocksize,sizeof(double));
  double *Bb_temp=(double *)calloc(blocksize,sizeof(double));
  double *Cb=(double *)calloc(blocksize,sizeof(double));
  double *C, *A, *B;
  double *expectedC=(double *)calloc(n*n,sizeof(double));

  // generate matrices on p0
  if(myid == 0) {
    generateInitialMatrices(&A,&B,&C, n);
    start = MPI_Wtime();
    distributedMatrixToProcesses(A,B, n, pn, &newtype,  proc_grid, &request);
  }

  //  printf ("grank: %d, myid: %d\n",grank,myid);

  // Determines  process  coords  in cartesian topology given rank in group
  MPI_Cart_coords(proc_grid,myid,numberOfDimensions,coords);
  MPI_Recv(Ab, blocksize, MPI_DOUBLE, 0, 1, proc_grid, &status);
  MPI_Recv(Bb, blocksize, MPI_DOUBLE, 0, 2, proc_grid, &status);
    
  // print_matrix(Ab, n/pn);
  // print_matrix(Bb, pn);

  // fox...
  /* Create a communicator for each row */
  // Creates new communicators based on colors and keys
  MPI_Comm_split(proc_grid,coords[0],coords[1],&proc_row);
  // Determines the rank of the calling process in the communicator
  MPI_Comm_rank(proc_row,&rowrank);

  /* Create a communicator for each column */
  // Creates new communicators based on colors and keys
  MPI_Comm_split(proc_grid,coords[1],coords[1],&proc_col);
  // Determines the rank of the calling process in the communicator
  MPI_Comm_rank(proc_col,&colrank); 
  MPI_Request req1, req2;
  int k, m;
  for(k = 0; k < pn; ++k) {
    m = (coords[0]+k) % pn;
    // printf("rowrank: %d, coords: %d, %d\n", rowrank, coords[0],coords[1]);
    memcpy(Ab_temp, Ab, sizeof(double)*blocksize);
    //print_matrix(Ab_temp, n/pn);
    MPI_Bcast(Ab_temp, blocksize, MPI_DOUBLE, m, proc_row);
    // shifting
    MPI_Irecv(Bb_temp, blocksize, MPI_DOUBLE, colrank == pn-1 ? 0 : colrank+1, 3, proc_col, &req1);
    MPI_Isend(Bb, blocksize, MPI_DOUBLE, colrank == 0 ? pn-1 : colrank-1, 3, proc_col, &req2);
    multiply(Ab_temp, Bb, Cb, n/pn);
    MPI_Wait(&req1, &status);
    MPI_Wait(&req2, &status);
    memcpy(Bb, Bb_temp, sizeof(double)*blocksize);
			
  }
   

  // print_matrix(Ab, 2, 4);
  // print_matrix(Cb, n/pn);


  // Assembly of individual tiles into the parent matrix taking place
  MPI_Isend(Cb, blocksize, MPI_DOUBLE, 0, 4, proc_grid, &request);
  if(myid == 0) {
    for(i = 0; i < pn*pn; ++i) {
      MPI_Probe(MPI_ANY_SOURCE, 4, proc_grid, &status);
      MPI_Cart_coords(proc_grid,status.MPI_SOURCE,numberOfDimensions,coords);
      MPI_Recv(&C[(n*(n*coords[0]+coords[1]))/pn], 1, newtype, status.MPI_SOURCE, 4, proc_grid, &status);
      end = MPI_Wtime();
	 
    }   
    // printf("%d, %d, %f\n", n, pn*pn, end-start);
    printf("Result Matrix C is:\n");
    multiply(A, B, expectedC, n);
    if(assertMatrices(C, expectedC, n)==1){
      printf("Test Case Passed!! \n");
    }else{
      printf("Test Case Failed! \n");
    }
   
    // print_matrix(C, n);
    free(A);
    free(B);
    free(C);
  }
  MPI_Wait(&request,&status);
  free(Ab);
  free(Ab_temp);
  free(Bb);
  free(Bb_temp);
  free(Cb);
  MPI_Finalize(); 

  return 0;
}

void fill_matrix(double *m, int n, int seed) {
  int row, col;
  srand(seed);
  for (row=0; row<n;row++)
    for (col=0; col<n;col++)
      m[row*n+col] = ((double)rand()*1000/(double)(RAND_MAX));
}

void generateIdentityMatrix(double *m, int n) {
  int row, col;
  for (row=0; row<n;row++)
    for (col=0; col<n;col++)
      m[row*n+col] = row == col ? 1 : 0;
}

void print_matrix(double *m, int n) {
  int row, col;
  for (row=0; row<n;row++){
    for (col=0; col<n;col++){
      printf("%f ", m[row*n+col]);
    }
    printf("\n");
  }
  printf("\n");
}



void multiply(double *a,double *b, double *c, int n) {
  int k,j,i;
  for(k = 0; k < n; ++k)
    for(i = 0; i < n; ++i)
      for(j = 0; j < n; ++j)
	c[i*n+j] += a[i*n+k]*b[k*n+j];
}

int assertMatrices(double *a,double *b, int n ) {
  int row, col;
  int flag = 1;
  for(row = 0; row < n; ++row)
    for(col = 0; col < n; ++col)
     {
        if(a[row*n+col]!=b[row*n+col]){
          flag = 0;
          break;
        }
     }
     return flag;
}




void generateInitialMatrices(double** A, double** B, double** C, int n){
  *A=(double *)calloc(n*n,sizeof(double));
  fill_matrix(*A, n, 23);
  printf("\nMatrix A is:\n");
  print_matrix(*A, n);

  *B=(double *)calloc(n*n,sizeof(double));
  // fill_matrix(*B, n, 101);
  generateIdentityMatrix(*B,n);
  printf("Matrix B is:\n");
  print_matrix(*B, n);

  *C=(double *)calloc(n*n,sizeof(double));
}

void distributedMatrixToProcesses(double* A, double* B, int n, int pn, MPI_Datatype *newtype,  MPI_Comm proc_grid, MPI_Request *request){
  int count=n/pn; int blockLength=n/pn; int stride=n; int grank;
  MPI_Type_vector(count,blockLength,stride,MPI_DOUBLE,newtype);
  MPI_Type_commit(newtype);
  int pos[2], i, j;
   	
  for(i = 0; i < pn; ++i) {
    for(j = 0; j < pn; ++j) {
      pos[0] = i; pos[1] = j;
      MPI_Cart_rank(proc_grid,pos,&grank);
      MPI_Isend(&A[(n*(n*i+j))/pn], 1, *newtype, grank, 1, proc_grid, request);
      MPI_Isend(&B[(n*(n*i+j))/pn], 1, *newtype, grank, 2, proc_grid, request);
    }
  }
}

