% Programación Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875  
%---------------------------------------------------------------

function [xf,iter1, iter2,flag] = misimplex(A,c,b)

% Resuelve por el metodo Simplex el problema estándar
%     Min      c'*x
% Sujeto a    A*x = b
%               x >= 0
%
% Dimensiones: A es mxn con m <= n y rango(A) = m
%             c es nx1  vector de la función objetivo
%             x es nx1  es la variable
%             b es mx1 lado derecho del sistema lineal, sin pérdida de
%               generalidad b >= 0.
%---------------------------------------------------------------
% In
% A .- matriz de mxn.
% c.- vector de nx1.
% b.- vector de mx1.
% xs.- vector columna de n componentes con el vértice inicial
%
% OUT
% xf .- vector de dimensión n con la vértice óptimo si existe solución.
% iter.- número de iteraciones que usa la fase II del Simplex.
% flag.- bandera que indica:
    % flag = -1, la region es vacía
    % flag = 0, el problema es no acotado inferiormente
    % flag = 1, el problema tiene solucion optima.
%---------------------------------------------------------------

[m,n] = size(A); % dimensiones de A
xf = [];
iter = 0; %Declara el número de iteraciónes en 0

%---------------------------------------------------------------
%FASE 1
[xs,vb,vnb,flag,iter1] = fase1(A,b); %Llama a la fase 1
%la xs que sale es de (n+m)x1

%---------------------------------------------------------------
%FASE 2
[xf,vb,vnb,flag, iter2] = fase2(A,b,c,xs,flag, vb, vnb); %Llama a la fase 2
iter = iter1 +iter2; % Calcula el número de iteraciones totales por fase 1 y 2

%---------------------------------------------------------------
% Imprimir resultados si hay solución
if(flag > 0)
    fprintf('El valor de la función objetivo es:') 
    c'*xf(1:n)
end 
end
