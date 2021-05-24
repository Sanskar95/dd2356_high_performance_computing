
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <assert.h>



void freeParentMatrices()
{
  free(A);
  free(B);
  free(C);
}

void freeChildrenMatrices()
{
  free(Ab);
  free(Ab_temp);
  free(Bb);
  free(Bb_temp);
  free(Cb);
}

void fill_matrix(double *m, int n, int seed)
{
  int row, col;
  srand(seed);
  for (row = 0; row < n; row++)
    for (col = 0; col < n; col++)
      m[row * n + col] = ((double)rand() * 1000 / (double)(RAND_MAX));
}

void generateIdentityMatrix(double *m, int n)
{
  int row, col;
  for (row = 0; row < n; row++)
    for (col = 0; col < n; col++)
      m[row * n + col] = row == col ? 1 : 0;
}

void print_matrix(double *m, int n)
{
  int row, col;
  for (row = 0; row < n; row++)
  {
    for (col = 0; col < n; col++)
    {
      printf("%f ", m[row * n + col]);
    }
    printf("\n");
  }
  printf("\n");
}

void multiply(double *a, double *b, double *c, int n)
{
  int k, j, i;
  for (k = 0; k < n; ++k)
    for (i = 0; i < n; ++i)
      for (j = 0; j < n; ++j)
        c[i * n + j] += a[i * n + k] * b[k * n + j];
}

int assertMatrices(double *a, double *b, int n)
{
  int row, col;
  int flag = 1;
  for (row = 0; row < n; ++row)
    for (col = 0; col < n; ++col)
    {
      if (a[row * n + col] != b[row * n + col])
      {
        flag = 0;
        break;
      }
    }
  return flag;
}

void generateInitialMatrices(double **A, double **B, double **C, int n)
{
  *A = (double *)calloc(n * n, sizeof(double));
  fill_matrix(*A, n, 23);
  printf("\nMatrix A is:\n");
  print_matrix(*A, n);

  *B = (double *)calloc(n * n, sizeof(double));
  generateIdentityMatrix(*B, n);
  printf("Matrix B is:\n");
  print_matrix(*B, n);

  *C = (double *)calloc(n * n, sizeof(double));
}

void distributedMatrixToProcesses(double *A, double *B, int n, int numBlocks, MPI_Datatype *newtype, MPI_Comm processGrid, MPI_Request *request)
{
  int count = n / numBlocks;
  int blockLength = n / numBlocks;
  int stride = n;
  int grank;
  MPI_Type_vector(count, blockLength, stride, MPI_DOUBLE, newtype);
  MPI_Type_commit(newtype);
  int pos[2], i, j;

  for (i = 0; i < numBlocks; ++i)
  {
    for (j = 0; j < numBlocks; ++j)
    {
      pos[0] = i;
      pos[1] = j;
      MPI_Cart_rank(processGrid, pos, &grank);
      MPI_Isend(&A[(n * (n * i + j)) / numBlocks], 1, *newtype, grank, 1, processGrid, request);
      MPI_Isend(&B[(n * (n * i + j)) / numBlocks], 1, *newtype, grank, 2, processGrid, request);
    }
  }
}



int main(int argc, char *argv[])
{

  int parentCommunicatorRank, numberOfProcesses;
  double start, end;

  MPI_Init(&argc, &argv);                              
  MPI_Comm_size(MPI_COMM_WORLD, &numberOfProcesses);     
  MPI_Comm_rank(MPI_COMM_WORLD, &parentCommunicatorRank);

  if (argc < 2 && parentCommunicatorRank == 0)
  {
    MPI_Finalize();
    return -1;
  }

  if (argc < 2 && parentCommunicatorRank != 0)
  {
    MPI_Finalize();
    return -1;
  }

  double a;
  int b;
  a = sqrt(atoi(argv[1]));
  b = a;

  int n = atoi(argv[1]);

  MPI_Status stat;
  int myRank, rowrank, columnRank;
  MPI_Comm processGrid, processRow, processColumn;
  MPI_Datatype newtype;
  int i, j;
  MPI_Request request;
  MPI_Status status;

  // 2d topology
  int numberOfDimensions = 2, dimensions[2] = {0, 0};

  // coordinates for each proc
  int coords[2];

  // reordering
  int reorder = 1;

  // wrap around
  int periods[2] = {0, 0};

  //dividing process in from of cartesian grid
  MPI_Dims_create(numberOfProcesses, numberOfDimensions, dimensions);

  //Creating communicators in from of cartesian grid, note that processGrid will be returned as new communivator
  MPI_Cart_create(MPI_COMM_WORLD, numberOfDimensions, dimensions, periods, reorder, &processGrid);
  // Determines the rank of the calling process in the communicator, Note: use proc_grid
  MPI_Comm_rank(processGrid, &myRank);

  // number of blocks on one row or col
  int numBlocks = dimensions[0];

  int blocksize = n * n / (numBlocks * numBlocks);
  double *Ab = (double *)calloc(blocksize, sizeof(double));
  double *Bb = (double *)calloc(blocksize, sizeof(double));
  double *Ab_temp = (double *)calloc(blocksize, sizeof(double));
  double *Bb_temp = (double *)calloc(blocksize, sizeof(double));
  double *Cb = (double *)calloc(blocksize, sizeof(double));
  double *C, *A, *B;
  double *expectedC = (double *)calloc(n * n, sizeof(double));

  // generate initial matrices on p0
  if (myRank == 0)
  {
    generateInitialMatrices(&A, &B, &C, n);
    start = MPI_Wtime();
    distributedMatrixToProcesses(A, B, n, numBlocks, &newtype, processGrid, &request);
  }

  // return process corrdinated in cartesian totology
  MPI_Cart_coords(processGrid, myRank, numberOfDimensions, coords);
  MPI_Recv(Ab, blocksize, MPI_DOUBLE, 0, 1, processGrid, &status);
  MPI_Recv(Bb, blocksize, MPI_DOUBLE, 0, 2, processGrid, &status);

  //Create row comm nd determine rank of process in it.
  MPI_Comm_split(processGrid, coords[0], coords[1], &processRow);
  MPI_Comm_rank(processRow, &rowrank);

  MPI_Comm_split(processGrid, coords[1], coords[1], &processColumn);
  MPI_Comm_rank(processColumn, &columnRank);

  MPI_Request req1, req2;
  int k, m;
  for (k = 0; k < numBlocks; ++k)
  {

    //Getting hold of the diagnols
    m = (coords[0] + k) % numBlocks;
    memcpy(Ab_temp, Ab, sizeof(double) * blocksize);
    MPI_Bcast(Ab_temp, blocksize, MPI_DOUBLE, m, processRow);
    MPI_Irecv(Bb_temp, blocksize, MPI_DOUBLE, columnRank == numBlocks - 1 ? 0 : columnRank + 1, 3, processColumn, &req1);
    MPI_Isend(Bb, blocksize, MPI_DOUBLE, columnRank == 0 ? numBlocks - 1 : columnRank - 1, 3, processColumn, &req2);
    multiply(Ab_temp, Bb, Cb, n / numBlocks);
    MPI_Wait(&req1, &status);
    MPI_Wait(&req2, &status);
    memcpy(Bb, Bb_temp, sizeof(double) * blocksize);
  }

  // Assembly of individual tiles into the parent matrix taking place
  MPI_Isend(Cb, blocksize, MPI_DOUBLE, 0, 4, processGrid, &request);
  if (myRank == 0)
  {
    for (i = 0; i < numBlocks * numBlocks; ++i)
    {
      MPI_Probe(MPI_ANY_SOURCE, 4, processGrid, &status);
      MPI_Cart_coords(processGrid, status.MPI_SOURCE, numberOfDimensions, coords);
      MPI_Recv(&C[(n * (n * coords[0] + coords[1])) / numBlocks], 1, newtype, status.MPI_SOURCE, 4, processGrid, &status);
      end = MPI_Wtime();
    }
    // printf("%d, %d, %f\n", n, pn*pn, end-start);
    printf("Result Matrix C is:\n");
    multiply(A, B, expectedC, n);
    if (assertMatrices(C, expectedC, n) == 1)
    {
      printf("Test Case Passed!! \n");
    }
    else
    {
      printf("Test Case Failed! \n");
    }

    freeParentMatrices()
  }
  MPI_Wait(&request, &status);
  freeChildrenMatrices()
      MPI_Finalize();

  return 0;
}

