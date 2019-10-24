%Ejemplo prueba3

A = [1 -1 1 0 0; 2 -1 0 1 0; 0 1 0 0 1];
b = [1 3 5]';
c = [-4,-3 0 0 0]';

[xf,iter,flag] = misimplex(A,c,b);