% Programaci�n Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875
%---------------------------------------------------------------

function [xs,vb,vnb,flag,iter] = fase2(A,b,c,xs,flag, vb, vnb)

% fase 2 del simplex para determinar una soluci�n para Min ct*x sa Ax=b
% IN
% A.- matriz mxn
% b.- vector mx1 de restricciones del problema original
% c.- vector nx1 funci�n objetivo del problema original
% xs.- vector obtenido en la fase 1 como v�rtice inicial 
% flag.- valor obtenido para ver si el problema es vacio (-1) o tiene
% vb.- componontes b�sicas de xs
% vnb.- componentes no b�sicas de xs
%
% OUT
% xs.- vector soluci�n, en caso de existir. 
% vb.- vector nx1 funci�n objetivo del problema original
% vnb.- vector mx1 de restricciones del problema original
% flag.- variable l�gica que toma valores 1 (solucion) 0 (no acotado inf.)
%        y -1 cuando el conjunto es vac�o. 
% iter.- regresa el n�mero de iteraciones de la fase 2.
%---------------------------------------------------------------

fprintf('ya entro a fase dos:') 

[m,n] = size(A); % dimensiones de A

fprintf('nuevas variables basicas') 
vb = vb(find(vb <= n))
vnb = vnb(find(vnb <= n))

iter = 0;

%-----------------------------------------------------------------------
% Revisar si el problema es no vac�o 
if (flag < 0)
    disp('EL conjunto factible es vacio')
    return
end

%-----------------------------------------------------------------------
% Modificar el problema para tener b(i) > 0 para toda i
for i = 1:m
    if b(i) < 0
        A(i,:) = -A(i,:);
        b(i) = -b(i);
    end
end

%-----------------------------------------------------------------------
% Variables extras
flag = -1;
itermax = 100000;

%-----------------------------------------------------------------------
% Hacer el simplex tantas veces como sea necesario con tope m�xmio

while (flag < 0 && iter <= itermax)
    [A,c,b,xs,vb,vnb,flag] = itersimplexbland(A,c,b,xs,vb,vnb,flag);
    iter = iter + 1; % obtener el n�mero de iteraciones en esta fase
end

%-----------------------------------------------------------------------
% Revisar si el problema es no acotado inferiormente
if (flag == 0)
    disp('El conjunto es no acotado inferiormente')
    return
end

end