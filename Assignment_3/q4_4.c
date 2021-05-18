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

    MPI_Init_thread(&argc,&argv, MPI_THREAD_SINGLE, &input);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    NUM_ITER = ITER/size;

    srand(SEED*rank); // Important: Multiply SEED by "rank" when you introduce MPI!

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
    
    int finalCount;
    double time0 = MPI_Wtime();
    MPI_Reduce(&count, &finalCount, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
    
    if (rank == 0)
    {
      // Estimate Pi and display the result
      pi = ((double)finalCount / (double)ITER) * 4.0;
      double time1 = MPI_Wtime();
      printf("The result is %f\n", pi);
      printf("Execution time is %f \n", time1-time0);
    }
    MPI_Finalize();
    return 0;
}