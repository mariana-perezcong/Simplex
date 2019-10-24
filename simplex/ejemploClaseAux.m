%Ejemplo auxiliar de clase, seleccionar 1
A = [1 2 4 1; 1 1 5 6];
b = [7 5]';
c = [1 2 3 1]';

[xf,iter,flag] = misimplex(A,c,b);