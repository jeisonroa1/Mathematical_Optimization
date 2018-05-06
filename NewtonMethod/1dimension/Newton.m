%% Metodo de Newton - Optimizaci�n Matem�tica
%% Jeison Ivan Roa M.
clear all
close all
clc
%% Inicializaci�n Variables
d1Min = 0.1;              % Valor de precisi�n de la busqueda
a = 0;                     % Intervalo de busqueda
b = 7;
rng('shuffle');            % Cambia la semilla para los numeros aleatorios
x = a + (b-a)*rand(1,1);   % Punto inicial de busqueda aleatorio.
dx = derivada1(x);         % Se halla la primera derivada en el punto inicial.
ddx = derivada2(x);        % Se halla la segunda derivada en el punto inicial.
cont = 1;
xk = [];
%% Inicio algoritmo 

while  abs(dx)>d1Min 
    %Paso 1: Se determina la direcci�n de busqueda.
    dx = derivada1(x);                % Se halla la primera derivada en el punto actual.
    ddx = derivada2(x);                % Se halla la segunda derivada en el punto actual.
    %Paso 2: Calculo del delta
    delta = -dx/ddx;
    %Paso 3: Desplazamiento en direcci�n del delta.
    x = x +(0.5*delta); 
    xk(cont)=x;
    cont = cont+1;
end
x
cont



%% Grafica
figure;
x = [0:0.001:7];
fx = (x-3).*x.^3.*(x-6).^4;
plot(x,fx);
foptimos = (xk-3).*xk.^3.*(xk-6).^4;
hold on
scatter(xk,foptimos);
axis([-0 7 -2500 1500])
set (gca,'fontsize',12); 
title ('M�todo de Newton - Variable �nica');
xlabel ('x');
ylabel ('y');
legend('Funci�n','Iteraciones')










