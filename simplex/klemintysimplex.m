% Programación Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875 
%---------------------------------------------------------------

%KleeMinty n = 5

b = [5 25 125 625 3125]';

A = [1 0 0 0 0 1 0 0 0 0;
     4 1 0 0 0 0 1 0 0 0; 
     8 4 1 0 0 0 0 1 0 0; 
     16 8 4 1 0 0 0 0 1 0;
     32 16 8 4 1 0 0 0 0 1];

c = [zeros(5-1,1);-1;zeros(5,1);];

[xf,iter1, iter2,flag] = misimplex(A,c,b);