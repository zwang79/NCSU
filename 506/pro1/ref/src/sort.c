#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
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
    int numThreads = 1;
    int tid;
	int offset_start = 0;
	int offset_end = 0;

		offset_start = numEdges/numThreads;
		offset_end = offset_start + (numEdges%numThreads);
    // auxiliary arrays, allocated at the start up of the program


	
    int **vertex_cnt = (int**)malloc(numThreads*sizeof(int *));
    for(i = 0;i<numThreads;i++)
         vertex_cnt[i] = (int*)malloc(numVertices*sizeof(int)); // needed for Counting Sort
	 


//	printf("\n Count Sort Parallel \n");
	#pragma omp parallel num_threads(numThreads) private (tid,i,key,pos) shared(vertex_cnt,edges,edges_sorted)
	{
		
		tid = omp_get_thread_num();
		for(i = 0; i < numVertices; ++i)
            vertex_cnt[tid][i] = 0;
	


		// count occurrence of key: id of a source vertex


    		if(tid != numThreads-1)
            {
                for(i = 0; i< offset_start; i++) {
					key = edges[((tid*offset_start)+i)].src;
                    vertex_cnt[tid][key]++;
                }

            }
            else
            {
                for(i = 0; i< offset_end; i++) {
                    key = edges[((tid*offset_start)+i)].src;
                    vertex_cnt[tid][key]++;
                }
	    
            }
		#pragma omp barrier	
	}

	


		int base = 0;
		int j;
		// transform to cumulative sum

    	for(i = 0; i < numVertices; ++i) {
			for(j = 0; j< numThreads ; j++) {
				base+= vertex_cnt[j][i];
				vertex_cnt[j][i] = base;
			}
		}		


	#pragma omp parallel num_threads(numThreads) private (tid,i,key,pos) shared(vertex_cnt,edges,edges_sorted)
	{
		tid = omp_get_thread_num();
		// fill-in the sorted array of edges
    		if(tid != numThreads-1)
            {
                for(i = offset_start-1; i>= 0; i--)
                {
                    key = edges[(offset_start*tid)+i].src;
                    pos = vertex_cnt[tid][key]-1;
                    edges_sorted[pos] = edges[(offset_start*tid)+i];
                    vertex_cnt[tid][key]--;
                }
            }
            else
            {
                for(i = offset_end-1; i>= 0; i--)
                {
                    key = edges[(offset_start*tid)+i].src;
                    pos = vertex_cnt[tid][key]-1;
                    edges_sorted[pos] = edges[(offset_start*tid)+i];
                    vertex_cnt[tid][key]--;
                }
            }
		#pragma omp barrier
	}


/*    printf("\n Count Sort Serial: \n");
    for(i = 0; i < numEdges; i++)
     	printf("%d->%d\n",edges_sorted[i].src, edges_sorted[i].dest); */

    free(vertex_cnt);

}



void countSortEdgesBySourceParallel(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {


    int i;
    int key;
    int pos;
    int numThreads = 2;
    int tid;
	int offset_start = 0;
	int offset_end = 0;

		offset_start = numEdges/numThreads;
		offset_end = offset_start + (numEdges%numThreads);
    // auxiliary arrays, allocated at the start up of the program


	
    int **vertex_cnt = (int**)malloc(numThreads*sizeof(int *));
    for(i = 0;i<numThreads;i++)
         vertex_cnt[i] = (int*)malloc(numVertices*sizeof(int)); // needed for Counting Sort
	 


//	printf("\n Count Sort Parallel \n");
	#pragma omp parallel num_threads(numThreads) private (tid,i,key,pos) shared(vertex_cnt,edges,edges_sorted)
	{
		
		tid = omp_get_thread_num();
		for(i = 0; i < numVertices; ++i)
            vertex_cnt[tid][i] = 0;
	


		// count occurrence of key: id of a source vertex


    		if(tid != numThreads-1)
            {
                for(i = 0; i< offset_start; i++) {
					key = edges[((tid*offset_start)+i)].src;
                    vertex_cnt[tid][key]++;
                }

            }
            else
            {
                for(i = 0; i< offset_end; i++) {
                    key = edges[((tid*offset_start)+i)].src;
                    vertex_cnt[tid][key]++;
                }
	    
            }
		#pragma omp barrier	
	}

	


		int base = 0;
		int j;
		// transform to cumulative sum

    	for(i = 0; i < numVertices; ++i) {
			for(j = 0; j< numThreads ; j++) {
				base+= vertex_cnt[j][i];
				vertex_cnt[j][i] = base;
			}
		}		


	#pragma omp parallel num_threads(numThreads) private (tid,i,key,pos) shared(vertex_cnt,edges,edges_sorted)
	{
		tid = omp_get_thread_num();
		// fill-in the sorted array of edges

    		if(tid != numThreads-1)
            {
                for(i = offset_start-1; i>= 0; i--)
                {
                    key = edges[(offset_start*tid)+i].src;
                    pos = vertex_cnt[tid][key]-1;
                    edges_sorted[pos] = edges[(offset_start*tid)+i];
                    vertex_cnt[tid][key]--;
                }
            }
            else
            {
                for(i = offset_end-1; i>= 0; i--)
                {
                    key = edges[(offset_start*tid)+i].src;
                    pos = vertex_cnt[tid][key]-1;
                    edges_sorted[pos] = edges[(offset_start*tid)+i];
                    vertex_cnt[tid][key]--;
                }
            }
		#pragma omp barrier
	}


 /*   printf("\n Count Sort Parallel: \n");
    for(i = 0; i < numEdges; i++)
     	printf("%d->%d\n",edges_sorted[i].src, edges_sorted[i].dest); */

    free(vertex_cnt);


}


void radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {
		
	int i;
	int max;
	int numThreads = 1;
	max = edges[0].src;
	for(i = 0; i < numEdges; ++i)
	{
		if (edges[i].src > max)
			max = edges[i].src;
	}
//	printf("\n Max = %d", max);
	for (i = 1; max/i > 0; i*=256)
	{
		int j;
		int key;
		int pos;

		// auxiliary arrays, allocated at the start up of the program
		int *vertex_cnt = (int*)malloc(numThreads*256*sizeof(int)); // needed for Counting Sort
		
		#pragma omp parallel num_threads(numThreads)
		{
			int tid = omp_get_thread_num();
			for(j = 0; j < 256; ++j) {
				vertex_cnt[((tid*256)+j)] = 0;
			}

		// count occurrence of key: id of a source vertex
			#pragma omp for
			for(j = 0; j < numEdges; ++j) {
				key = ((edges[j].src/i) % 256);
				vertex_cnt[((tid*256)+key)]++;
			}
		}


		int base = 0;
		int m;
		// transform to cumulative sum

    		for(m = 0; m < 256; ++m) {
			for(j = 0; j< numThreads ; j++) {
					base+= vertex_cnt[((j*256)+m)];
					vertex_cnt[((j*256)+m)] = base;
				}
		}

		#pragma omp parallel num_threads(numThreads)
		{
			int tid = omp_get_thread_num();
			// fill-in the sorted array of edges
			#pragma omp for
				for(j = numEdges - 1; j >= 0; --j) {
					key = ((edges[j].src/i) % 256);
					pos = vertex_cnt[((tid*256)+key)] - 1;
					edges_sorted[pos] = edges[j];
					vertex_cnt[((tid*256)+key)]--;
			}
		}
		
		for(j = 0; j<numEdges; j++)
			edges[j] = edges_sorted[j];


		free(vertex_cnt);
	}

 /*   	printf("\n Radix sort Serial:\n");
     for(i = 0; i < numEdges; i++)
     	printf("%d->%d\n",edges_sorted[i].src, edges_sorted[i].dest);*/

 } 
 

void radixSortEdgesBySourceParallel(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges) {
	
    int i;
    int key;
    int pos;
    int numThreads = 2;
    int tid;
	int offset_start = 0;
	int offset_end = 0;
	
	int digit;
	int max = 0;
	
	for(i = 0; i<numEdges; ++i)
	{
		if(edges[i].src > max)
			max = edges[i].src;
	}

		offset_start = numEdges/numThreads;
		offset_end = offset_start + (numEdges%numThreads);
    // auxiliary arrays, allocated at the start up of the program

	for(digit =1;max/digit>0;digit*=10)
    {
	
		int **vertex_cnt = (int**)malloc(numThreads*sizeof(int *));
		for(i = 0;i<numThreads;i++)
			vertex_cnt[i] = (int*)malloc(10*sizeof(int)); // needed for Counting Sort
	 



		#pragma omp parallel num_threads(numThreads) private (tid,i,key,pos) shared(vertex_cnt,edges,edges_sorted)
		{
		
			tid = omp_get_thread_num();
			for(i = 0; i < 10; ++i)
				vertex_cnt[tid][i] = 0;
	
		#pragma omp barrier

		// count occurrence of key: id of a source vertex


    		if(tid != numThreads-1)
            {
                for(i = 0; i< offset_start; i++) {
					key = (edges[((tid*offset_start)+i)].src/digit)%10;
                    vertex_cnt[tid][key]++;
                }

            }
            else
            {
                for(i = 0; i< offset_end; i++) {
                    key = (edges[((tid*offset_start)+i)].src/digit)%10;
                    vertex_cnt[tid][key]++;
                }
	    
            }
			#pragma omp barrier	
		}

	


		int base = 0;
		int j;
		// transform to cumulative sum

    	for(i = 0; i < 10; ++i) {
			for(j = 0; j< numThreads ; j++) {
				base+= vertex_cnt[j][i];
				vertex_cnt[j][i] = base;
			}
		}		


		#pragma omp parallel num_threads(numThreads) private (tid,i,key,pos) shared(vertex_cnt,edges,edges_sorted)
		{
			tid = omp_get_thread_num();
			// fill-in the sorted array of edges

			if(tid != numThreads-1)
            {
                for(i = offset_start-1; i>= 0; i--)
                {
                    key = (edges[(offset_start*tid)+i].src/digit)%10;
                    pos = vertex_cnt[tid][key]-1;
                    edges_sorted[pos] = edges[(offset_start*tid)+i];
                    vertex_cnt[tid][key]--;
                }
            }
            else
            {
                for(i = offset_end-1; i>= 0; i--)
                {
                    key = (edges[(offset_start*tid)+i].src/digit)%10;
                    pos = vertex_cnt[tid][key]-1;
                    edges_sorted[pos] = edges[(offset_start*tid)+i];
                    vertex_cnt[tid][key]--;
                }
            }
			#pragma omp barrier
		}

        //printEdgeArray(edges_sorted, numEdges); 


		free(vertex_cnt);
	
		for(i = 0;i<numEdges;i++)
            edges[i] = edges_sorted[i];

	}
 /*   printf("\n Count Sort Parallel: \n");
		for(i = 0; i < numEdges; i++)
			printf("%d->%d\n",edges_sorted[i].src, edges_sorted[i].dest); */
}
