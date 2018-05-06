%% Metodo de Descenso de gradiente con tasa de aprendizaje variable - Optimizaci�n Matem�tica
%% Jeison Roa
%% Diego Barragan
clear all
close all
clc
%% Inicializaci�n Variables

derivadaMin = 0.1;       % Valor de precisi�n de la busqueda
a = 0;                     % Intervalo de busqueda
b = 7;
rng('shuffle');            % Cambia la semilla para los numeros aleatorios
x = a + (b-a)*rand(1,1);  % Punto inicial de busqueda aleatorio.
alfa = 1;                 % Tasa de aprendizaje.
derivada = 1;   
cont = 1;
xk(1,:) = x;
%% Inicio algoritmo 

while  abs(derivada)>derivadaMin
    %Paso 1: Se determina la direcci�n de busqueda.
    derivada = derivada1(x)/1000; % Se halla la derivada en el punto inicial.
    %Paso 2: Se encuentra la tasa de aprendizaje para la actualizaci�n
    alfa = Golden(x,derivada);
    %Paso 3: Desplazamiento en direcci�n de la derivada
    x = x - (alfa*derivada); 
    xk(cont+1)=x; % Guarda todos el punto en cada iteraci�n
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
title ('Descenso de gradiente con tasa de aprendizaje variable - Variable �nica');
xlabel ('x');
ylabel ('y');
legend('Funci�n','Iteraciones')







