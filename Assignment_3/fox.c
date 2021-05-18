
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

void initializeMatrix(double *m, int n, int seed) {
  int row, col;
  srand(seed);
  for (row=0; row<n;row++)
    for (col=0; col<n;col++)
      m[row*n+col] = ((double)rand()*1000/(double)(RAND_MAX));
}

void initializeIdentityMatrix(double *m, int n) {
  int row, col;
  for (row=0; row<n;row++)
    for (col=0; col<n;col++)
      m[row*n+col] = row == col ? 1 : 0;
}

void printMatrix(double *m, int n) {
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

void generate(double** A, double** B, double** C, int n){
  *A=(double *)calloc(n*n,sizeof(double));
  initializeMatrix(*A, n, 23);
  printf("\nMatrix A is:\n");
  printMatrix(*A, n);

  *B=(double *)calloc(n*n,sizeof(double));
  initializeIdentityMatrix(*B,n);
  printf("Matrix B is:\n");
  printMatrix(*B, n);

  *C=(double *)calloc(n*n,sizeof(double));
}

void distribute(double* A, double* B, int n, int pn, MPI_Datatype *newtype,  MPI_Comm proc_grid, MPI_Request *request){
  int count=n/pn; int blocklen=n/pn; int stride=n; int grank;
  MPI_Type_vector(count,blocklen,stride,MPI_DOUBLE,newtype);
  MPI_Type_commit(newtype);
  int pos[2], i, j;
   	
  for(i = 0; i < pn; ++i) {
    for(j = 0; j < pn; ++j) {
      pos[0] = i; pos[1] = j;
      MPI_Cart_rank(proc_grid,pos,&grank);
      MPI_Isend(&A[(n*(n*i+j))/pn], 1, *newtype, grank, 111, proc_grid, request);
      MPI_Isend(&B[(n*(n*i+j))/pn], 1, *newtype, grank, 222, proc_grid, request);
    }
  }
}




int main (int argc, char *argv[]) {

  int wrank, nproc;
  double start, end;
  double start_time;  
  double finish_time; 
  double final_time; 

  MPI_Init(&argc, &argv);              
  MPI_Comm_size(MPI_COMM_WORLD, &nproc); 
  MPI_Comm_rank(MPI_COMM_WORLD, &wrank);

  if(argc < 2 && wrank == 0) {
    printf("Usage: mpirun -np 4 ./fox n (where n is the matrix size)\n");
    MPI_Finalize(); 
    return -1;
  }

  if(argc < 2 && wrank != 0) {
    MPI_Finalize(); 
    return -1;
  }

  double a; int b;
  a = sqrt(atoi(argv[1]));
  b = a;
  int n = atoi(argv[1]);

  MPI_Status stat;
  int myRank, rowrank, colrank;
  MPI_Comm processGrid, proc_row, proc_col;
  MPI_Datatype newtype;
  int i,j;
  MPI_Request request;
  MPI_Status status;

  int numberOfDimensions=2,dims[2]={0,0};

  // coordinates for each proc
  int coordinates[2];
    
  int reorder=1;
    
  int periods[2]={0,0};


  MPI_Dims_create(nproc,numberOfDimensions,dims);
  MPI_Cart_create(MPI_COMM_WORLD,numberOfDimensions,dims,periods,reorder,&processGrid);
  MPI_Comm_rank(processGrid,&myRank);

  int pn = dims[0];

  int blockChunkSize = n*n/(pn*pn);
  double *Ab=(double *)calloc(blockChunkSize,sizeof(double));
  double *Bb=(double *)calloc(blockChunkSize,sizeof(double));
  double *AbTemp=(double *)calloc(blockChunkSize,sizeof(double));
  double *BbTemp=(double *)calloc(blockChunkSize,sizeof(double));
  double *Cb=(double *)calloc(blockChunkSize,sizeof(double));
  double *C, *A, *B;

  if(myRank == 0) {
    generate(&A,&B,&C, n);
    start = MPI_Wtime();
    distribute(A,B, n, pn, &newtype,  processGrid, &request);
  }

  MPI_Cart_coords(processGrid,myRank,numberOfDimensions,coordinates);
  MPI_Recv(Ab, blockChunkSize, MPI_DOUBLE, 0, 111, processGrid, &status);
  MPI_Recv(Bb, blockChunkSize, MPI_DOUBLE, 0, 222, processGrid, &status);
    
  printMatrix(Ab, n/pn);
  printMatrix(Bb, pn);



  MPI_Comm_split(processGrid,coordinates[0],coordinates[1],&proc_row);
  MPI_Comm_rank(proc_row,&rowrank);



  MPI_Comm_split(processGrid,coordinates[1],coordinates[1],&proc_col);
  MPI_Comm_rank(proc_col,&colrank); 
  MPI_Request req1, req2;
  int k, m;
  for(k = 0; k < pn; ++k) {
    m = (coordinates[0]+k) % pn;
    printf("rowrank: %d, coords: %d, %d\n", rowrank, coordinates[0],coordinates[1]);
    memcpy(AbTemp, Ab, sizeof(double)*blockChunkSize);
    printMatrix(AbTemp, n/pn);
    MPI_Bcast(AbTemp, blockChunkSize, MPI_DOUBLE, m, proc_row);


    MPI_Irecv(BbTemp, blockChunkSize, MPI_DOUBLE, colrank == pn-1 ? 0 : colrank+1, 333, proc_col, &req1);
    MPI_Isend(Bb, blockChunkSize, MPI_DOUBLE, colrank == 0 ? pn-1 : colrank-1, 333, proc_col, &req2);
    multiply(AbTemp, Bb, Cb, n/pn);
    MPI_Wait(&req1, &status);
    MPI_Wait(&req2, &status);
    memcpy(Bb, BbTemp, sizeof(double)*blockChunkSize);
			
  }

  MPI_Isend(Cb, blockChunkSize, MPI_DOUBLE, 0, 444, processGrid, &request);
  if(myRank == 0) {
    for(i = 0; i < pn*pn; ++i) {
      MPI_Probe(MPI_ANY_SOURCE, 444, proc_grid, &status);
      MPI_Cart_coords(processGrid,status.MPI_SOURCE,numberOfDimensions,coordinates);
      MPI_Recv(&C[(n*(n*coordinates[0]+coordinates[1]))/pn], 1, newtype, status.MPI_SOURCE, 444, processGrid, &status);
      end = MPI_Wtime();
	 
    }   
    printf("%d, %d, %f\n", n, pn*pn, end-start);
    printf("Result Matrix C is:\n");
    printMatrix(C, n);
    free(A);
    free(B);
    free(C);
  }
  MPI_Wait(&request,&status);
  free(Ab);
  free(AbTemp);
  free(Bb);
  free(BbTemp);
  free(Cb);
  MPI_Finalize(); 

  return 0;
}