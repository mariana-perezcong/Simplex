function [ A,c,b,xs,vb,vnb,flag] = itersimplexbland(A,c,b,xs,vb,vnb,flag )
% Una iteración del método Simplex para el problema de forma estándar
% 
%     Min      c'*x
% Sujeto a    A*x = b
%               x >= 0
%
% Dimensiones: A es mxn con m < n y rango(A) = m
%             c es nx1  vector de la función objetivo
%             x es nx1  es la variable
%             b es mx1 lado derecho del sistema lineal, sin pérdida de
%               generalidad b >= 0.
%---------------------------------------------------------------
% In
% A .- matriz de mxn.
% c.- vector de nx1.
% b.- vector de mx1.
% xs.- vector de nx1, es un vértice del conjunto {x | A*x = b, x >= 0}.
% vb.- vector de índices con tamaño mx1 con las variables básicas de xs.
% vnb.- vector de índices con tamaño (n-m)x1 con las variables no
%        básicas de xs.
% flag.- variable lógica que toma el valor -1,0,1, según este vacío, 
%        no acotado inferiormente o tenga solución respectivamente.
% Out
% A .- matriz de mxn, no cambia en la iteración.
% c.- vector de nx1, no cambia en la iteración.
% b.- vector de mx, no cambia en la itercaión
% xs.- vector de nx1, es un vértice del conjunto {x | A+x = b, x >= 0}.
%      cambia en la ireración.
% vb.- vector de índices con tamaño mx1 con las variables básicas de xs,
%      cambia en la iteración.
% vnb.- vector de índices con tamaño (n-m)x1 con las variables no
%        básicas de xs. Cambia en la itercaión.
% flag.- variable lógica que toma el valor -1,0,1, según este vacío, 
%        no acotado inferiormente o tenga solución respectivamente.
%
% Simultáneamente un índice de vb pasa a vnb  y un índice de vnb pasa a vb.
%------------------------------------------------------------------------
% Programación Lineal
% ITAM
% Octubre 14 de 2019.
%------------------------------------------------------------------------
% Programación Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875  

[m,n] = size(A);          % dimensión del problema
B = A(:,vb);          % columnas básicas
cB = c(vb);               % vector básico
%------------------------------------------------------------------
% Cálculo de los costos reducidos
vpi = (B')\(cB);            % Sistema lineal ; B'*vpi = cB
cbar = zeros(n-m,1);
for j = 1:n-m
    cbar(j) = c(vnb(j))- vpi'*A(:,vnb(j));  % costo reducido
end

[cbarmin,qq] = mymin(cbar);  % Regla de Bland *primer índice*
q =vnb(qq);                % índice donde ocurre el menor costo reducido 
%cbarmin                    % menor costo reducido

%-----------------------------------------------------------
if (cbarmin < 0)
   % Se calcula la arista o una dirección para moverse
     w = B\A(:,q);           % vector arista y vector dirección
     test = sum( w >0);       % en busca de componentes positivas en w
     if (test >0)
         [wp,ind] = compositivas(w); % componentes positivas de w
         vtheta = xs(vb(ind))./wp;   %movimientos
         [theta, jj] = min( vtheta); % menor movimiento
         p = vb(ind(jj));            % variable básica que saldrá
         %-----------------------------------------------
         %Actualizamos valores
         xs(vb) = xs(vb)-theta*w;    % movimiento de las variables básicas
         xs(q) = theta;              % nueva coordenada básica. 
         vb(ind(jj)) = q;             % variable básica que entra
         vnb(qq) = p;                 % variable que cambia a no básica
         vb=sort(vb);                   %ordenar los básicos
         vnb=sort(vnb);                  %ordenar los indices básicos
     else
         disp(' SE ENCONTRÓ UNA DIRECCIÓN')
         flag = 0;
         return % Para regresar en caso de que el problema sea no acotado
     end
else
    flag = 1; %Se encontro que el problema tiene solución
end
%-------------------------------------------------------

%-------------------------------------------------------

end

