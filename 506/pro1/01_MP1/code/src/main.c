#include <stdio.h>
#include <memory.h>

#include "bfs.h"
#include "sort.h"
#include "edgelist.h" 
#include "vertex.h"
#include "timer.h"



void printMessageWithtime(const char * msg, double time){

    printf(" -----------------------------------------------------\n");
    printf("| %-51s | \n", msg);
    printf(" -----------------------------------------------------\n");
    printf("| %-51f | \n", time);
    printf(" -----------------------------------------------------\n");

}


int main(void) {

    
    //const char * fname = "./datasets/test/test.txt";
    //const char * fname = "./datasets/test/test1.txt";
    const char * fname = "./datasets/wiki-vote/wiki-Vote.txt";
    //const char * fname = "./datasets/facebook/facebook_combined.txt";
    //const char * fname = "./datasets/RMAT/RMAT22";
    //const char * fname = "./datasets/RMAT/RMAT18";

    
    int numOfVertices = 0;
    int numOfEdges = 0;
    struct Timer* timer = (struct Timer*) malloc(sizeof(struct Timer));

    // get |v| |e| count do we can allocate our edge array and vertex array
    loadEdgeArrayInfo(fname, &numOfVertices, &numOfEdges);
    printf("Edges : %d Vertices: %d\n", numOfEdges, numOfVertices);

    // allocate our edge array and vertex array
    struct Edge * edgeArray = newEdgeArray(numOfEdges);
    struct Edge * sortedEdgeArray = newEdgeArray(numOfEdges);
    struct Vertex * vertexArray =  newVertexArray(numOfVertices);

    // populate the edge array from file
    loadEdgeArray(fname, edgeArray);
    


    /*the function you need to optimize*/
    printf("#######################################################\n");
    printf("#######################################################\n");
    printf("File being sorted is:'");
    printf(fname);
    printf("'\n");
    Start(timer);
    radixSortEdgesBySource(sortedEdgeArray, edgeArray, numOfVertices, numOfEdges);
    Stop(timer);
    printMessageWithtime("Time for radixSorting (Seconds)",Seconds(timer));
    printf("Parallel version as follows:\n");
    printf("############################\n");
    printf("Configurations:\n");
    printf("###############\n");
    printf("Radix used for radixSorting: ");
    printf("%d (Defined in './include/sort.h')\n", radix);
    printf("#######################################################\n");
    printf("Number of Threads: %d (Defined in './include/sort.h')\n",NUMOFTHRD);
    printf("#######################################################\n");
    Start(timer);
    OpenMP_with_false_sharing_issue_radixSortEdgesBySource(sortedEdgeArray, edgeArray, numOfVertices, numOfEdges);
    Stop(timer);
    printMessageWithtime("Time for Parallel radixSorting with false-sharing issue (Seconds)",Seconds(timer));
    Start(timer);
    OpenMP_radixSortEdgesBySource(sortedEdgeArray, edgeArray, numOfVertices, numOfEdges);
    Stop(timer);
    printMessageWithtime("Time for Parallel radixSorting without false-sharing (Seconds)",Seconds(timer));
    //countSortEdgesBySource(sortedEdgeArray, edgeArray, numOfVertices, numOfEdges);
    /*the function you need to optimize*/


    // if you want to check
    //printEdgeArray(edgeArray, numOfEdges); // print the edge list unsorted 
    //printEdgeArray(sortedEdgeArray, numOfEdges); 

    mapVertices(vertexArray, sortedEdgeArray, numOfVertices, numOfEdges);

    Start(timer);
    bfs(6, vertexArray, sortedEdgeArray, numOfVertices, numOfEdges);
    Stop(timer);
    printMessageWithtime("Time BFS (Seconds)",Seconds(timer));
    printf("#######################################################\n");
    printf("#######################################################\n");

    free(sortedEdgeArray);
    free(vertexArray);
    free(edgeArray);
    
    return 0;
}


