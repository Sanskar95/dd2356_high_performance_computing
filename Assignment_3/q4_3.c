#include <mpi.h>  
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define SEED     921
#define ITER 1000000000

int main(int argc, char* argv[])
{
    int count = 0;
    double x, y, z, pi;  
    int size, rank, input, NUM_ITER;  //MPI variables
    
    MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &input);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    NUM_ITER = ITER/size;

    srand(SEED*rank); // Important: Multiply SEED by "rank" when you introduce MPI!
    
    

    if (rank == 0) {
      int countArray[size-1];
      MPI_Request req[size-1];
    
      for (int i = 1; i < size; i++) {
        MPI_Irecv(&countArray[i-1], 1, MPI_INT, i, 0, MPI_COMM_WORLD, &req[i-1]);
      }


      // Calculate PI following a Monte Carlo method
      for (int iter = 0; iter < NUM_ITER; iter++)
      {
        // Generate random (X,Y) points
        x = (double)random() / (double)RAND_MAX;
        y = (double)random() / (double)RAND_MAX;
        z = sqrt((x*x) + (y*y));


        // Check if point is in unit circle
        if (z <= 1.0)
        {
            count++;
        }
      }
 
      double time0 = MPI_Wtime();
      MPI_Waitall(size - 1, req, MPI_STATUSES_IGNORE);
      int finalCount;
      finalCount += count;

      for (int i = 0; i < size - 1; i++) {
        finalCount += countArray[i];
      }
     
      pi = ((double) finalCount / (double)ITER) * 4.0;
      double time1 = MPI_Wtime();
      printf("The result is Pi = %f\n", pi);
      printf("Execution time is %f \n", time1-time0);
    }
    else {  //do it again
      for (int iter = 0; iter < NUM_ITER; iter++)
      {
        // Generate random (X,Y) points
        x = (double)random() / (double)RAND_MAX;
        y = (double)random() / (double)RAND_MAX;
        z = sqrt((x*x) + (y*y));
        
        // Check if point is in unit circle
        if (z <= 1.0)
        {
          count++;
        }
      } 
      MPI_Send(&count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
    MPI_Finalize();
    return 0;
}