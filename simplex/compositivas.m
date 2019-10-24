% Programación Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875  
%---------------------------------------------------------------

function [wpos,indpos]=compositivas(w)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    wp=[];
    ind=[];
for i=1:length(w)
    if w(i)>0
        wp=[wp,w(i)]; %valor positivo del vector w
        ind=[ind,i]; %indice del valor positivo del valor w
    end
end
wpos=wp';
indpos=ind';
end

