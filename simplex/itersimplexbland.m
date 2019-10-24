function [ A,c,b,xs,vb,vnb,flag] = itersimplexbland(A,c,b,xs,vb,vnb,flag )
% Una iteraci�n del m�todo Simplex para el problema de forma est�ndar
% 
%     Min      c'*x
% Sujeto a    A*x = b
%               x >= 0
%
% Dimensiones: A es mxn con m < n y rango(A) = m
%             c es nx1  vector de la funci�n objetivo
%             x es nx1  es la variable
%             b es mx1 lado derecho del sistema lineal, sin p�rdida de
%               generalidad b >= 0.
%---------------------------------------------------------------
% In
% A .- matriz de mxn.
% c.- vector de nx1.
% b.- vector de mx1.
% xs.- vector de nx1, es un v�rtice del conjunto {x | A*x = b, x >= 0}.
% vb.- vector de �ndices con tama�o mx1 con las variables b�sicas de xs.
% vnb.- vector de �ndices con tama�o (n-m)x1 con las variables no
%        b�sicas de xs.
% flag.- variable l�gica que toma el valor -1,0,1, seg�n este vac�o, 
%        no acotado inferiormente o tenga soluci�n respectivamente.
% Out
% A .- matriz de mxn, no cambia en la iteraci�n.
% c.- vector de nx1, no cambia en la iteraci�n.
% b.- vector de mx, no cambia en la itercai�n
% xs.- vector de nx1, es un v�rtice del conjunto {x | A+x = b, x >= 0}.
%      cambia en la ireraci�n.
% vb.- vector de �ndices con tama�o mx1 con las variables b�sicas de xs,
%      cambia en la iteraci�n.
% vnb.- vector de �ndices con tama�o (n-m)x1 con las variables no
%        b�sicas de xs. Cambia en la itercai�n.
% flag.- variable l�gica que toma el valor -1,0,1, seg�n este vac�o, 
%        no acotado inferiormente o tenga soluci�n respectivamente.
%
% Simult�neamente un �ndice de vb pasa a vnb  y un �ndice de vnb pasa a vb.
%------------------------------------------------------------------------
% Programaci�n Lineal
% ITAM
% Octubre 14 de 2019.
%------------------------------------------------------------------------
% Programaci�n Lineal
%  ITAM
%   14 de octubre del 2019.
% Primer Proyecto 
%   Mariana Perez-Cong Sanchez 170891
%   Manuel Alberto Quintero Coronel 159889
%   Uriel Martinez Leon  164875  

[m,n] = size(A);          % dimensi�n del problema
B = A(:,vb);          % columnas b�sicas
cB = c(vb);               % vector b�sico
%------------------------------------------------------------------
% C�lculo de los costos reducidos
vpi = (B')\(cB);            % Sistema lineal ; B'*vpi = cB
cbar = zeros(n-m,1);
for j = 1:n-m
    cbar(j) = c(vnb(j))- vpi'*A(:,vnb(j));  % costo reducido
end

[cbarmin,qq] = mymin(cbar);  % Regla de Bland *primer �ndice*
q =vnb(qq);                % �ndice donde ocurre el menor costo reducido 
%cbarmin                    % menor costo reducido

%-----------------------------------------------------------
if (cbarmin < 0)
   % Se calcula la arista o una direcci�n para moverse
     w = B\A(:,q);           % vector arista y vector direcci�n
     test = sum( w >0);       % en busca de componentes positivas en w
     if (test >0)
         [wp,ind] = compositivas(w); % componentes positivas de w
         vtheta = xs(vb(ind))./wp;   %movimientos
         [theta, jj] = min( vtheta); % menor movimiento
         p = vb(ind(jj));            % variable b�sica que saldr�
         %-----------------------------------------------
         %Actualizamos valores
         xs(vb) = xs(vb)-theta*w;    % movimiento de las variables b�sicas
         xs(q) = theta;              % nueva coordenada b�sica. 
         vb(ind(jj)) = q;             % variable b�sica que entra
         vnb(qq) = p;                 % variable que cambia a no b�sica
         vb=sort(vb);                   %ordenar los b�sicos
         vnb=sort(vnb);                  %ordenar los indices b�sicos
     else
         disp(' SE ENCONTR� UNA DIRECCI�N')
         flag = 0;
         return % Para regresar en caso de que el problema sea no acotado
     end
else
    flag = 1; %Se encontro que el problema tiene soluci�n
end
%-------------------------------------------------------

%-------------------------------------------------------

end

