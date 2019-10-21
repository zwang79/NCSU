#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>
// #include <omp.h>

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


    int d;
    int i;
    int key;
    int pos;
    int t; 
    int *vertex_temp = (int*)malloc(numVertices*sizeof(int));
    struct Edge * sorted_temp = newEdgeArray(numEdges);


    for (d = 0; d < 4; d++) {

        for (i = 0; i < numEdges; i++) {
            if (d == 0) sorted_temp[i] = edges[i];
            else sorted_temp[i] = edges_sorted[i];
        }

        t = pow(10,d);
        for (i = 0; i < numEdges; i++) {
            vertex_temp[i] = sorted_temp[i].src / t % 10;
        }

         // auxiliary arrays, allocated at the start up of the program
        int *vertex_cnt = (int*)malloc(numVertices*sizeof(int)); // needed for Counting Sort

        for(i = 0; i < numVertices; ++i) {
            vertex_cnt[i] = 0;
        }

        // count occurrence of key: id of a source vertex
        for(i = 0; i < numEdges; ++i) {
            key = vertex_temp[i];
            vertex_cnt[key]++;
        }

        // transform to cumulative sum
        for(i = 1; i < numVertices; ++i) {
            vertex_cnt[i] += vertex_cnt[i - 1];
        }

        // fill-in the sorted array of edges
        for(i = numEdges - 1; i >= 0; --i) {
            key = vertex_temp[i];
            pos = vertex_cnt[key] - 1;
            edges_sorted[pos] = sorted_temp[i];
            vertex_cnt[key]--;
        }


        free(vertex_cnt);

        printEdgeArray(edges_sorted, numEdges);
        }

   


}
