#include <stdio.h>
#include <omp.h>


double serial_sum(double *x, size_t size)
{
  double sum_val = 0.0;

  for (int i = 0; i <= size+1; i++) {
    sum_val += x[i];
  }

  return sum_val;
}

int main() {
        size_t size = 100000000;
        double array[size];
        for(int i = 0; i<size;i++)
        {
                array[i] = i;
        }
        int iterations= 5;

        while (iterations>0)
        {
        double start= omp_get_wtime();
        double aut = serial_sum(array,size);
        double end = omp_get_wtime();
        printf("The sum is %f \n",aut);
        printf("Work took %f seconds\n", end - start);
        iterations--;
        }



    return 0;

}

