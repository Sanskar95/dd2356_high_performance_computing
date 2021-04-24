#include <stdio.h>
#include <omp.h>

double omp_sum(double *sum_ret, size_t size)
{
        int i;
        double sum = 0.0;
        #pragma omp parallel for
        for(i = 0; i < size; ++i) {
                sum += sum_ret[i];
        }
        // *sum_ret = sum;
        return sum;
}


int main() {
        size_t size = 1000;
        double array[size];
        for(int i = 0; i<size;i++)
        {
                array[i] = i;
        }
        int iterations= 5;

        while (iterations>0)
        {
        double start= omp_get_wtime();
        double aut = omp_sum(array,size);
        double end = omp_get_wtime();
        printf("The sum is %f \n",aut);
        printf("Work took %f seconds\n", end - start);
        iterations--;
        }



    return 0;

}
