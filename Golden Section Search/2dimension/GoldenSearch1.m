%% Optimización Busqueda Dorada
%% Jeison Ivan Roa Mora 20131005056
%% Diego Barragan Vargas

%% Inicialización
close all; clear all;
lmin=0.1; % Criterio de convergencia
R=0.3819;  % Relación dorada
a = -50;    % Valores iniciales. Rango de busqueda.
b = 50;
n = 1;
%% Optimización en X con Y constante
y = a + (b-a).*rand(1,1); % Generación de punto aleatorio en Y.
c = a + (b-a)*R;
d = b - (b-a)*R;
fc = funcion1(c,y);
fd = funcion1(d,y);
optimosx(1) = (a+b)/2;
while (b-a)>lmin
   
    if fc < fd
        b = d;
        d = c;
        c = a + (b-a)*R;
        fd = fc;
        fc = funcion1(c,y);
    else
        a = c;
        c = d;
        d = b - (b-a)*R;
        fc = fd;
        fd = funcion1(d,y);
    end
    optimosx(n+1) = (a+b)/2;
    n = n+1;
end
optimox = (a+b)/2
iteracionesx= n-1;


%% Optimización en Y con el optimo encontrado en X
a = -50;    % Valores iniciales. Rango de busqueda.
b = 50;
n = 1;
x = optimox; % Se toma el óptimo encontrado en el ciclo anterior
c = a + (b-a)*R;
d = b - (b-a)*R;
fc = funcion1(x,c);
fd = funcion1(x,d);
optimosx(1) = (a+b)/2;
while (b-a)>lmin
   
    if fc < fd
        b = d;
        d = c;
        c = a + (b-a)*R;
        fd = fc;
        fc = funcion1(x,c);
    else
        a = c;
        c = d;
        d = b - (b-a)*R;
        fc = fd;
        fd = funcion1(x,d);
    end
    optimosy(n+1) = (a+b)/2;
    n = n+1;
end
optimoy = (a+b)/2;
iteracionesy= n-1;

%% Grafica 2
figure;
xx = [-50:1:50];
yy = [-50:1:50];
for i=1:length(xx)
    for j=1:length(yy)
fxy(i,j) = funcion1(xx(i),yy(j));
    end
end
for i=1:length(optimosx)
    consy(i) = y;
end
for i=1:length(optimosy)
    consx(i) = x;
end

surface(xx,yy,fxy);
hold on;
scatter(optimosx,consy, 'r');
hold on;
scatter(consx,optimosy, 'c');
set (gca,'fontsize',12); 
title ('Golden Search - Dos Variables');
xlabel ('x');
ylabel ('y');
zlabel ('z');
legend('Función','Iteraciones en X','Iteraciones en Y')

