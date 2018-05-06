%% Optimización: Busqueda de la sección Dorada
%% Jeison Ivan Roa Mora

%% Inicialización
close all; clear all;
lmin=0.1; % Criterio de convergencia
R=0.3819;  % Relación dorada
a = 0;    % Valores iniciales. Rango de busqueda.
b = 8;
n = 1;

%% Inicio Algoritmo
c = a + (b-a)*R;
d = b - (b-a)*R;
fc = funcion(c);
fd = funcion(d);
optimos(1) = (a+b)/2;
while (b-a)>lmin
    
    if fc < fd
        b = d;
        d = c;
        c = a + (b-a)*R;
        fd = fc;
        fc = funcion(c);
    else
        a = c;
        c = d;
        d = b - (b-a)*R;
        fc = fd;
        fd = funcion(d);
    end
    optimos(n+1) = (a+b)/2;
    n = n+1;
end
optimo = (a+b)/2
n-1

%% Grafica
figure;
x = [0:0.001:7];
fx = (x-3).*x.^3.*(x-6).^4;
plot(x,fx);
foptimos = (optimos-3).*optimos.^3.*(optimos-6).^4;
hold on
scatter(optimos,foptimos);
set (gca,'fontsize',12); 
title ('Golden Search - Variable única');
xlabel ('x');
ylabel ('y');
legend('Función','Iteraciones')



