function A = set_adjacency_matrix(v, N)
% SET THE WEIGHT MATRIX AND THE INITIAL GRAPH
Weights = set_weights_matrix(v, N);
GraphK = ones(N) - eye(N);

% SET THE ADJACENCY MATRIX
[w_st, ST, X_st] = kruskal(GraphK, Weights);
A = X_st;
A = A + eye(N);





% A =       [
%              1 1 0 0 0 0 0
%              1 1 1 1 0 0 0
%              0 1 1 0 0 0 0
%              0 1 0 1 1 0 0
%              0 0 0 1 1 1 1
%              0 0 0 0 1 1 0
%              0 0 0 0 1 0 1
%              ];
end

