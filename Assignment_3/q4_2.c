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
    double sizeLoop = log2(size);
    int difference;
    int flag = 1;
    int i;
    double time0 = MPI_Wtime();

    for (i = 0; i < sizeLoop; i++)
    {
        if (flag)
        {
            difference = (int)pow(2,i + 1);
            if ((rank + difference) % difference)
            {
                MPI_Send(&count, 1, MPI_INT, (rank - pow(2,i)), 0, MPI_COMM_WORLD);
                flag = 0;
            }
            else
            {
                MPI_Recv(&count, 1, MPI_INT, (rank + pow(2, i)), 0, MPI_COMM_WORLD,  MPI_STATUS_IGNORE);
                count += count;
            }
        }
    }
    // Estimate Pi and display the result 

    if (rank == 0)
    {
        pi = ((double)count / (double)ITER) * 4.0;
        double time1 = MPI_Wtime();
        printf("The result is Pi = %f\n", pi);
        printf("Execution time is %f\n", time1-time0);
    }
    MPI_Finalize();                                                                                           
    return 0;
}
