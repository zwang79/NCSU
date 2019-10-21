#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>
#include <omp.h>

#include "sort.h"
#include "edgelist.h"

// Order edges by id of a source vertex, 
// using the Counting Sort
// Complexity: O(E + V)
void countSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {

    
    int i;
    int key;
    int pos;

    // auxiliary arrays, allocated at the start up of the program
    int *vertex_cnt = (int*)malloc(numVertices*sizeof(int)); // needed for Counting Sort

    for(i = 0; i < numVertices; ++i) {
        vertex_cnt[i] = 0;
    }

    // count occurrence of key: id of a source vertex
    for(i = 0; i < numEdges; ++i) {
        key = edges[i].src;
        vertex_cnt[key]++;
    }

    // transform to cumulative sum
    for(i = 1; i < numVertices; ++i) {
        vertex_cnt[i] += vertex_cnt[i - 1];
    }

    // fill-in the sorted array of edges
    for(i = numEdges - 1; i >= 0; --i) {
        key = edges[i].src;
        pos = vertex_cnt[key] - 1;
        edges_sorted[pos] = edges[i];
        vertex_cnt[key]--;
    }


    free(vertex_cnt);

}


void radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {


    //int d;
    int i;
    int key;
    int pos;
    int t = 1; 
    int radix = 10;
    //int numofiterations;
    struct Edge *sorted_temp = newEdgeArray(numEdges);
    int largest_vertex = 0;


    for (i = 0; i < numEdges; ++i)
    {
        if (largest_vertex < edges[i].src) largest_vertex = edges[i].src;
    }

   // numofiterations = log(largest_vertex)/log(radix) + 1;
   // printf("****%d*****",numofiterations);

    for (t = 1; largest_vertex / t > 0; t = t * radix) 
    {

        for (i = 0; i < numEdges; i++) {
            if (t == 1) sorted_temp[i] = edges[i];
            else sorted_temp[i] = edges_sorted[i];
        }


         // auxiliary arrays, allocated at the start up of the program
        int *vertex_cnt = (int*)malloc(radix*sizeof(int)); // needed for Counting Sort

        for(i = 0; i < radix; ++i) {
            vertex_cnt[i] = 0;
        }

        // count occurrence of key: id of a source vertex
        for(i = 0; i < numEdges; ++i) {
            key = sorted_temp[i].src / t % radix;
            vertex_cnt[key]++;
        }

        // transform to cumulative sum
        for(i = 1; i < radix; ++i) {
            vertex_cnt[i] += vertex_cnt[i - 1];
        }

        // fill-in the sorted array of edges
        for(i = numEdges - 1; i >= 0; --i) {
            key = sorted_temp[i].src / t % radix;
            vertex_cnt[key]--;
            pos = vertex_cnt[key];
            edges_sorted[pos] = sorted_temp[i];

        }


        free(vertex_cnt);

       // printEdgeArray(edges_sorted, numEdges);
        


    }

    free(sorted_temp);   


}

void OpenMP_radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {


    //int d;
    int i;
    int j;
    //int key;
    //int pos;
    int t = 1;
    int radix = 10; 
    struct Edge *sorted_temp = newEdgeArray(numEdges);
    int largest_vertex = 0;
    //int numofiterations;
    int numofthreads = 1;
    int Edgeperthread = 0;
    int Edgelastthread = 0;
    int lastthread = 0;

    omp_set_num_threads(numofthreads);

    if (numEdges % numofthreads == 0)
    {
     //   printf("??????????\n");
        Edgeperthread    = numEdges / numofthreads;
    }
    else
    {
    //    printf("!!!!!!!!!\n");
        Edgeperthread    = numEdges / numofthreads + 1;
        lastthread       = numEdges / Edgeperthread;
        //Edgelastthread   = Edgeperthread + numEdges - Edgeperthread * numofthreads;
        Edgelastthread   = numEdges - Edgeperthread * lastthread;
    }

   // printf("Edgeperthread = %d\n", Edgeperthread);
    //printf("Edgelastthread = %d\n", Edgelastthread);


    for (i = 0; i < numEdges; ++i)
    {
        if (largest_vertex < edges[i].src) largest_vertex = edges[i].src;
    }



    for (t = 1; largest_vertex / t > 0; t = t * radix) 
    {

        for (i = 0; i < numEdges; i++) 
        {
            if (t == 1) sorted_temp[i] = edges[i];
            else sorted_temp[i] = edges_sorted[i];
        }

        // auxiliary arrays, allocated at the start up of the program
        int **vertex_cnt = (int**)malloc(numofthreads*sizeof(int *));
        for (i = 0; i < numofthreads; ++i) 
        {
            vertex_cnt[i] = (int*)malloc(radix*sizeof(int)); // needed for Counting Sort
        }
        

        #pragma omp parallel 
        {
            int i, key;
            int id = omp_get_thread_num();
            int nthrds = omp_get_num_threads(); 
 
            // initialize
            for(i = 0; i < radix; ++i)
            {
                vertex_cnt[id][i] = 0;
            }

            #pragma omp barrier

            // count occurrence of key: id of a source vertex
            if (id == lastthread)
            {
            //   printf("111111111111\n");
                if (nthrds != 1)
                {
              //      printf("3333333333333333333\n");
                    if (Edgelastthread != 0)
                    {
 
                        for(i = 0; i < Edgelastthread; ++i) 
                        {
                            key = sorted_temp[numEdges - Edgelastthread + i].src / t % radix;
                            vertex_cnt[id][key]++;
                        }
                    }
                }
                else
                {
                //    printf("22222222222222\n");
                    for(i = 0; i < Edgeperthread; ++i) 
                    {
                        key = sorted_temp[Edgeperthread * id + i].src / t % radix;
                        vertex_cnt[id][key]++;
                    }
                }      
                
            }
            else
            {
                if (id < lastthread)
                {
                    for(i = 0; i < Edgeperthread; ++i) 
                    {
                        key = sorted_temp[Edgeperthread * id + i].src / t % radix;
                        vertex_cnt[id][key]++;
                    }
                }   
            }
            
        }



        int sum = 0;
        // transform to cumulative sum
        for(i = 0; i < radix; ++i) 
        {
            for(j = 0; j < numofthreads; ++j) 
            {
                sum += vertex_cnt[j][i];
                vertex_cnt[j][i] = sum;
            }

        }


        #pragma omp parallel 
        {
            int i, key, pos;
            int id = omp_get_thread_num();
            int nthrds = omp_get_num_threads();  

            if (id == lastthread)
            {
               // printf("111111111111");
                if (nthrds != 1)
                {
                 //   printf("3333333333333333333");
                    if (Edgelastthread != 0)
                    {
 
                        for(i = 0; i < Edgelastthread; ++i) 
                        {
                            key = sorted_temp[numEdges - 1 - i].src / t % radix;
                            vertex_cnt[id][key]--;
                            pos = vertex_cnt[id][key];
                            edges_sorted[pos] = sorted_temp[numEdges - 1 - i];
                        }
                    }
                }
                else
                {
                   // printf("22222222222222");
                    for(i = 0; i < Edgeperthread; ++i) 
                    {
                        key = sorted_temp[Edgeperthread * (id + 1) - 1 - i].src / t % radix;
                        vertex_cnt[id][key]--;
                        pos = vertex_cnt[id][key];
                        edges_sorted[pos] = sorted_temp[Edgeperthread * (id + 1) - 1 - i];
                    }
                }      
                
            }
            else
            {
                if (id < lastthread)
                {
                    for(i = 0; i < Edgeperthread; ++i) 
                    {
                        key = sorted_temp[Edgeperthread * (id + 1) - 1 - i].src / t % radix;
                        vertex_cnt[id][key]--;
                        pos = vertex_cnt[id][key];
                        edges_sorted[pos] = sorted_temp[Edgeperthread * (id + 1) - 1 - i];
                    }
                }   
            }


            


        }

        free(vertex_cnt);


       // printEdgeArray(edges_sorted, numEdges);

    }

    free(sorted_temp);   


    
}
