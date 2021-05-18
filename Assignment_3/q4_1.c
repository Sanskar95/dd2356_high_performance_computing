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
    int rank, size, input, NUM_ITER;

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
    
    double time0 = MPI_Wtime();

    if(rank != 0)
    {
        MPI_Send(&count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
    else
    {
        int finalCount;
        for (int i = 0; i < size; i++)
        {
            finalCount += count; 
            if (i != 0)
            {
                MPI_Recv(&count, 1, MPI_INT, i, 0, MPI_COMM_WORLD,MPI_STATUS_IGNORE);
            }
        }
    
    // Estimate Pi and display the result
    //pi = ((double)count / (double)NUM_ITER) * 4.0;
    pi = ((double) finalCount / (double)ITER) * 4.0;
    double time1 = MPI_Wtime();
    printf("The result is Pi = %f\n", pi);
    double time = time1 - time0; 
    printf("Execution time is %f\n", time);
    }
    MPI_Finalize();
    return 0;
}

