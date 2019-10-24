% Ejemplo del problema auxiliar y es vacio
A = [-2 1 3;2 3 4];
b = [2 1]';
c = [1 -2 3]';

[xf,iter,flag] = misimplex(A,c,b);