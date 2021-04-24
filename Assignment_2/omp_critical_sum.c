#include <stdio.h>
#include <omp.h>



double omp_critical_sum(double *sum_ret, size_t size)
{
        double sum = 0.0;
        #pragma omp parallel for
        for(int i = 0; i < size; ++i) {
                #pragma omp critical
                sum += sum_ret[i];
        }
        *sum_ret = sum;
        return sum;
}


int main() {
        size_t size = 1000;
        double array[size];
        for(int j = 0; j<size;j++)
        {
                array[j] = j;
        }


        double start= omp_get_wtime();
        double aut = omp_critical_sum(array,size);
        double end = omp_get_wtime();
        printf("The sum is %f \n",aut);
        printf("Work took %f seconds\n", end - start);

    return 0;

}