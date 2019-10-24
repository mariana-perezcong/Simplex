%Problema no acotado inferiormente

A = [1 0 0 -5 0 1; 0 1 1 -1 0 1; 0 0 1 -2 1 0];
c = [0 0 -3 2 0 -3]';
b = [5 4 2]';

[xf,iter,flag] = misimplex(A,c,b);