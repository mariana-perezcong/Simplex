% Programación Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875 
%---------------------------------------------------------------

%Lectura del archivo
load('afiro.mat', 'A');
load('afiro.mat', 'b')
load('afiro.mat', 'c')
load('afiro.mat', 'hi')
load('afiro.mat', 'lo')

%AFIRO
% Resuelve por el metodo Simplex el problema estándar
%     Min      c'*x
% Sujeto a    A*x = b
%             0 <= x <= hi
%Convertir el problema a la forma estandar

Aa = [A zeros(27,51)]; % Matriz [A 0]
h = [eye(51) eye(51)]; % Concatenacón de dos matrices identidad de 51x51
% La primera identidad es para las x y la segunda es para las variables de
% holgura para satisfacer la condicion x<=hi --> x+w=hi

Aaux = [Aa' h']';       % Concatenacion de las matrices A y h
cc = [c' zeros(1,51)]'; % funcion objetivo concatenado a 51 ceros para las variables de holgura
baux = [b' hi']';       % restriccion b concatenado con la restriccion hi

%     Min      c'*x
% Sujeto a    Aa*(x,w)' = (b,h)'
%             x>=0

[xf,iter1, iter2, flag] = misimplex(Aaux,cc,baux);
