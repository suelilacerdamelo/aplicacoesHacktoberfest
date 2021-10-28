// Aluno: Ygor Matheus Lacerda de Melo - 481699

#include <stdio.h>
#include <omp.h>

int main()
{
    int i;

    // Inclusao do #pragma
    #pragma omp parallel num_threads(2) // seta o número de threads em 2
    {
        int tid = omp_get_thread_num(); // lê o identificador da thread
        #pragma omp for ordered
        for(i = 1; i <= 3; i++)
        {
           printf("[PRINT1] T%d = %d \n",tid,i);
           printf("[PRINT2] T%d = %d \n",tid,i);
        }
    }
}