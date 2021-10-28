/*
* Grupo 9: Tarefa 3
* ***********************************
* Ana Luiza Pacheco Leite
* Darlan Francisco Gandos da Cunha	
* Larisse Leite Matias
* Ygor Matheus Lacerda de Melo
* ***********************************
* Sequencial: 2.193s
* Parelelo: 1.423s
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>

int CrivodeEratostenes(int n){
   // Crie um array booleano "primo [0..n]" e inicialize
   // todas as entradas são verdadeiras. Um valor em primo [i] irá
   // finalmente ser falso se i não for primo, senão verdadeiro.
   int primo = 0; 
   bool *primos = (bool*) malloc((n+1)*sizeof(bool));
   int sqrt_n = sqrt(n);
   memset(primos, true,(n+1)*sizeof(bool));
   #pragma omp parallel for schedule(dynamic)
   for (int cont=2; cont <= sqrt_n; cont++){
       // Se primo [cont] não for alterado, então é um primo
       if (primos[cont] == true){
        	  // Atualize todos os múltiplos de cont
           for (int i=cont*2; i<=n; i += cont)
           primos[i] = false;
        }
    }
    // contar números primos
    #pragma omp parallel for reduction(+:primo)
    for (int cont=2; cont<=n; cont++)
       if (primos[cont])
         primo++;
    return(primo);
}

int main(){
   int n = 100000000;
   printf("%d\n",CrivodeEratostenes(n));
   return 0;
}
