%% Algoritmo Bold Driver para una variable - Optimización Matemática
%% Jeison Ivan Roa M.
clear all
close all
clc
%% Inicialización Variables

derivadaMin = 0.1;        % Valor de precisión de la busqueda
a = 0;                     % Intervalo de busqueda
b = 7;
rng('shuffle');            % Cambia la semilla para los numeros aleatorios
x = a + (b-a)*rand(1,1);   % Punto inicial de busqueda aleatorio.
n = 0.001;                  % Variable Bold Driver
derivada = 1;   
cont = 1;
xk(1,:) = x;

%% Inicio algoritmo 

while  abs(derivada)>derivadaMin
    %Paso 1: Se determina la dirección de busqueda.
    derivada = derivada1(x); % Se halla la derivada en el punto inicial.
    %Paso 2: Desplazamiento en dirección de la derivada
    x = x - (n*derivada); 
    xk(cont+1)=x;
    if funcion(xk(cont+1))>= funcion(xk(cont))
        n = n/2;
    else
        n = 1.01*n;
    end
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
axis([0 7 -2500 1500])
set (gca,'fontsize',12); 
title ('Bold driver - Variable única');
xlabel ('x');
ylabel ('y');
legend('Función','Iteraciones')







