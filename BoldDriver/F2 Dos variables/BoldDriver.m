%% Algoritmo Bold Driver para dos variables - Optimización Matemática
%% Jeison Ivan Roa M.
clear all
close all
clc
%% Inicialización Variables

gradienteMin = 0.0001;                            % Valor de precisión de la busqueda
a = -35;                                          % Intervalo de busqueda
b = 35;
rng('shuffle');                                   % Cambia la semilla para los numeros aleatorios
x = [a + (b-a)*rand(1,1), a + (b-a)*rand(1,1)];   % Punto inicial de busqueda aleatorio.
n = 0.0001;                                       % Tasa de Bold Driver
[gradiente(1) gradiente(2)] = gradientex(x(1),x(2));  % Cálculo del gradiente en el punto inicial.
cont = 1;
xk(1,:) = x;
%% Inicio algoritmo 

while  norm(gradiente)>gradienteMin
    %Paso 1: Se halla el gradiente y así la dirección de busqueda
    [gradiente(1) gradiente(2)] = gradientex(x(1),x(2));  
    %Paso 3: Desplazamiento en dirección negativa de gradiente
     x = x - (n*gradiente); 
     xk(cont+1,:)=x;  % Se guarda cada iteración
     if funcion(xk(cont+1,:))>= funcion(xk(cont,:))
        n = n/2;
     else
        n = 1.01*n;
     end
     cont = cont+1;
end

%% Grafica
figure;
xx = [-35:1:35];
yy = [-35:1:35];
for i=1:length(xx)
    for j=1:length(yy)
fxy(i,j) = funcion([xx(i),yy(j)]);
    end
end
surface(xx,yy,fxy);
hold on;
scatter(xk(:,1),xk(:,2),'r');
set (gca,'fontsize',12); 
title ('Bold driver - Dos variables');
xlabel ('x');
ylabel ('y');
ylabel ('z');
legend('Función','Iteraciones')








