#include <stdio.h>
#include <omp.h>


double omp_padded_sum(double *sum_ret,size_t size)
{
	const int MAX_THREADS = omp_get_max_threads();
	int pad_factor = 64/sizeof(double)*2;
	double partial_sums[MAX_THREADS*pad_factor];
	int i, tid;
    double sum=0;
	
	#pragma omp parallel private(tid)
	{
		tid = omp_get_thread_num();
		partial_sums[tid*pad_factor] = 0.0;
		#pragma omp for
		for(i = 0; i < size; ++i) {
			partial_sums[tid*pad_factor] += sum_ret[i];
		}
	}
	
	*sum_ret = 0.0;
	for(i = 0; i < MAX_THREADS; ++i) {
		sum += partial_sums[i*pad_factor];
	}
}



int main() {
        size_t size = 1000;
        double array[size];
        for(int j = 0; j<size;j++)
        {
                array[j] = j;
        }
        
        double start= omp_get_wtime();
        double aut = omp_padded_sum(array,size);
        double end = omp_get_wtime();
        printf("The sum is %f \n",aut);
        printf("Work took %f seconds\n", end - start);

    return 0;

}