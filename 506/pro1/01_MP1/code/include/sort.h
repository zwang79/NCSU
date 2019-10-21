#ifndef SORT_H
#define SORT_H
#define NUMOFTHRD 8
#define radix 256 // 2^8
#include "edgelist.h"
// Order edges by id of a source vertex, 
// using the Counting Sort
// Complexity: O(E + V)
void countSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges);
void radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges);
void OpenMP_with_false_sharing_issue_radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges);
void OpenMP_radixSortEdgesBySource(struct Edge *edges_sorted, struct Edge *edges, int numVertices, int numEdges);

#endif
