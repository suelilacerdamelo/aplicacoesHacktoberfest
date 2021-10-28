/*
* Pontifícia Universidade Católica de Minas Gerais
* Computação Paralela - Tarefa12
*
* ***********************************
* 
* Ana Luiza Pacheco Leite
* Darlan Francisco Gandos da Cunha	
* Larisse Leite Matias
* Ygor Matheus Lacerda de Melo
*
* ***********************************
*
* Tempo de execucao sequencial: 0m4.42 | SpeedUp
* Tempo de execucao paralelo (NO STAGGER): 0m2.94 | SpeedUp = 1.50
* Tempo de execucao paralelo (SCHEDULE DYNAMIC): 0m2.75 | SpeedUp = 1.60
*
*/

#include <stdio.h>
#include <stdlib.h>

int main(){
    int i, j, n = 30000; 

    // Allocate input, output and position arrays
    int *in = (int*) calloc(n, sizeof(int));
    int *pos = (int*) calloc(n, sizeof(int));   
    int *out = (int*) calloc(n, sizeof(int));   

    // Initialize input array in the reverse order
    for(i=0; i < n; i++)
        in[i] = n-i;  

    // Print input array
    //   for(i=0; i < n; i++) 
    //      printf("%d ",in[i]);
    
    #pragma omp parallel num_threads(2)
    {
        // Silly sort (you have to make this code parallel)
	    #pragma omp for private(j) schedule(dynamic,200)
        for(i=0; i < n; i++)
            for(j=0; j < n; j++)
	            if(in[i] > in[j]) 
                    pos[i]++;
	}
   
    // Move elements to final position
    for(i=0; i < n; i++) 
        out[pos[i]] = in[i];

    // print output array
    //   for(i=0; i < n; i++) 
    //      printf("%d ",out[i]);

    // Check if answer is correct
    for(i=0; i < n; i++)
        if(i+1 != out[i]){
            printf("test failed\n");
            exit(0);
        }

    printf("test passed\n"); 
}  