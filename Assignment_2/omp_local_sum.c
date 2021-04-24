#include <stdio.h>
#include <omp.h>

double omp_local_sum(double *sum_ret, size_t size)
{
	const int MAX_THREADS = omp_get_max_threads();
	double partial_sums[MAX_THREADS];
	int i, tid;
    double sum=0.0;

	#pragma omp parallel private(tid)
	{
		tid = omp_get_thread_num();
		partial_sums[tid] = 0.0;
		#pragma omp for
		for(i = 0; i < size; ++i) {
			partial_sums[tid] += sum_ret[i];
		}
		
	}

    for(int k=0; k<MAX_THREADS; k++){
        sum += partial_sums[k];
    }
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
        double aut = omp_local_sum(array,size);
        double end = omp_get_wtime();
        printf("The sum is %f \n",aut);
        printf("Work took %f seconds\n", end - start);

    return 0;

}