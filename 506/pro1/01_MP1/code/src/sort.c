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
    //int radix = 10;
    //int numofiterations;
    struct Edge *sorted_temp = newEdgeArray(numEdges);
    int largest_vertex = 0;

    // auxiliary arrays, allocated at the start up of the program
    int *vertex_cnt = (int*)malloc(radix*sizeof(int)); // needed for Counting Sort



    for (i = 0; i < numEdges; ++i)
    {
        if (largest_vertex < edges[i].src) largest_vertex = edges[i].src;
    }

    // find how many iterations required
    for (t = 1; largest_vertex / t > 0; t = t * radix) 
    {

        for (i = 0; i < numEdges; i++) {
            if (t == 1) sorted_temp[i] = edges[i];
            else sorted_temp[i] = edges_sorted[i];
        }


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

       // printEdgeArray(edges_sorted, numEdges);
        
    }

    free(vertex_cnt);
    free(sorted_temp);   
}



void OpenMP_with_false_sharing_issue_radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {


    int i;
    int j;
    int t = 1;
    //int radix = 10; 
    struct Edge *sorted_temp = newEdgeArray(numEdges);
    int largest_vertex = 0;
    int numofthreads = NUMOFTHRD;
    int Edgeperthread = 0;
    int Edgelastthread = 0;
    int lastthread = 0;

    omp_set_num_threads(numofthreads);

    if (numEdges % numofthreads == 0)
    {
        Edgeperthread    = numEdges / numofthreads;
    }
    else
    {
        Edgeperthread    = numEdges / numofthreads + 1;
        lastthread       = numEdges / Edgeperthread;
        Edgelastthread   = numEdges - Edgeperthread * lastthread;
    }

    for (i = 0; i < numEdges; ++i)
    {
        if (largest_vertex < edges[i].src) largest_vertex = edges[i].src;
    }


    // auxiliary arrays, allocated at the start up of the program
    int **vertex_cnt = (int**)malloc(numofthreads*sizeof(int *));
    for (i = 0; i < numofthreads; ++i) 
    {
        vertex_cnt[i] = (int*)malloc(radix*sizeof(int)); // needed for Counting Sort
    }   


    for (t = 1; largest_vertex / t > 0; t = t * radix) 
    {

        for (i = 0; i < numEdges; i++) 
        {
            if (t == 1) sorted_temp[i] = edges[i];
            else sorted_temp[i] = edges_sorted[i];
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
                if (nthrds != 1)
                {
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
                if (nthrds != 1)
                {
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

        //free(vertex_cnt);

       // printEdgeArray(edges_sorted, numEdges);

    }


    for (i = 0; i < numofthreads; ++i) 
    {
        free(vertex_cnt[i]);
    }
    free(vertex_cnt);

    free(sorted_temp);      
}







void OpenMP_radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {


    int i;
    int j;
    int pad = 8; // fix false-sharing issue
    int t = 1;
    //int radix = 10; 
    struct Edge *sorted_temp = newEdgeArray(numEdges);
    int largest_vertex = 0;
    int numofthreads = NUMOFTHRD;
    int Edgeperthread = 0;
    int Edgelastthread = 0;
    int lastthread = 0;

    omp_set_num_threads(numofthreads);

    // manually distribute threads
    if (numEdges % numofthreads == 0)
    {
        Edgeperthread    = numEdges / numofthreads;
    }
    else
    {
        Edgeperthread    = numEdges / numofthreads + 1;
        lastthread       = numEdges / Edgeperthread;
        Edgelastthread   = numEdges - Edgeperthread * lastthread;
    }

    for (i = 0; i < numEdges; ++i)
    {
        if (largest_vertex < edges[i].src) largest_vertex = edges[i].src;
    }


    // auxiliary arrays, allocated at the start up of the program
    int ***vertex_cnt = (int***)malloc(numofthreads*sizeof(int **));
    for (i = 0; i < numofthreads; ++i) 
    {
        vertex_cnt[i] = (int**)malloc(radix*sizeof(int*)); // needed for Counting Sort
    }
    for (i = 0; i < numofthreads; ++i)
    {
        for (j = 0; j < radix; ++j)
        {
            vertex_cnt[i][j] = (int*)malloc(pad*sizeof(int));
        }
    }


    // find how many iterations required
    for (t = 1; largest_vertex / t > 0; t = t * radix) 
    {

        for (i = 0; i < numEdges; i++) 
        {
            if (t == 1) sorted_temp[i] = edges[i];
            else sorted_temp[i] = edges_sorted[i];
        }


        #pragma omp parallel 
        {
            int i, key;
            int id = omp_get_thread_num();
            int nthrds = omp_get_num_threads(); 
 
            // initialize
            for(i = 0; i < radix; ++i)
            {
                vertex_cnt[id][i][0] = 0;
            }

            #pragma omp barrier

            // count occurrence of key: id of a source vertex
            if (id == lastthread)
            {
                if (nthrds != 1)
                {
                    if (Edgelastthread != 0)
                    {
 
                        for(i = 0; i < Edgelastthread; ++i) 
                        {
                            key = sorted_temp[numEdges - Edgelastthread + i].src / t % radix;
                            vertex_cnt[id][key][0]++;
                        }
                    }
                }
                else
                {
                    for(i = 0; i < Edgeperthread; ++i) 
                    {
                        key = sorted_temp[Edgeperthread * id + i].src / t % radix;
                        vertex_cnt[id][key][0]++;
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
                        vertex_cnt[id][key][0]++;
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
                sum += vertex_cnt[j][i][0];
                vertex_cnt[j][i][0] = sum;
            }

        }


        #pragma omp parallel 
        {
            int i, key, pos;
            int id = omp_get_thread_num();
            int nthrds = omp_get_num_threads();  

            if (id == lastthread)
            {
                if (nthrds != 1)
                {
                    if (Edgelastthread != 0)
                    {
 
                        for(i = 0; i < Edgelastthread; ++i) 
                        {
                            key = sorted_temp[numEdges - 1 - i].src / t % radix;
                            vertex_cnt[id][key][0]--;
                            pos = vertex_cnt[id][key][0];
                            edges_sorted[pos] = sorted_temp[numEdges - 1 - i];
                        }
                    }
                }
                else
                {
                    for(i = 0; i < Edgeperthread; ++i) 
                    {
                        key = sorted_temp[Edgeperthread * (id + 1) - 1 - i].src / t % radix;
                        vertex_cnt[id][key][0]--;
                        pos = vertex_cnt[id][key][0];
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
                        vertex_cnt[id][key][0]--;
                        pos = vertex_cnt[id][key][0];
                        edges_sorted[pos] = sorted_temp[Edgeperthread * (id + 1) - 1 - i];
                    }
                }   
            }
        }

        
       // printEdgeArray(edges_sorted, numEdges);

    }

    // deallocate

    for (i = 0; i < numofthreads; ++i)
    {
        for (j = 0; j < radix; ++j)
        {
            free(vertex_cnt[i][j]);
        }
    }
    for (i = 0; i < numofthreads; ++i) 
    {
        free(vertex_cnt[i]); 
    }
    free(vertex_cnt);
    


    free(sorted_temp);       
}
