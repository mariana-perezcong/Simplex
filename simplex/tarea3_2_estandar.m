%Ejemplo con b(i) < 0 Tarea 3 Ejercicio 2
%Problema en forma canónica, seleccionar 0 

A = [-2 -1 1 0 0; -2, 4 0 1 0; -1, 3 0 0 1];
b = [4 -8 -7]';
c = [1 1 0 0 0]';

[xf,iter,flag] = misimplex(A,c,b);