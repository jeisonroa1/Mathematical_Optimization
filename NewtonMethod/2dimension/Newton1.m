%% Metodo de Newton - Optimización Matemática
%% Jeison Ivan Roa M.
clear all
close all
clc
%% Inicialización Variables
gradienteMin = 0.1;                                    % Valor de precisión de la busqueda
a = -35;                                             % Intervalo de busqueda
b = 35;
rng('shuffle');                                      % Cambia la semilla para los numeros aleatorios
x = [a + (b-a)*rand(1,1), a + (b-a)*rand(1,1)];      % Punto inicial de busqueda aleatorio. 
alfa = [];                                           % Tasa de aprendizaje.
[gradiente(1) gradiente(2)] = gradientex(x(1),x(2)); % Calculo del gradiente y la matriz Hessiana en el punto inicial.
cont = 1;
xk = [];
%% Inicio algoritmo 

while  norm(gradiente)>gradienteMin
    %Paso 1: Se determina la dirección de busqueda.
    [gradiente(1) gradiente(2)] = gradientex(x(1),x(2)); % Calculo del gradiente y la matriz Hessiana en el punto actual.
    addx = ddx(x(1),x(2));
    addy = ddy(x(1),x(2));
    adxdy = dxdy(x(1),x(2));
    hessiana = [addx, adxdy ; adxdy , addy ];
    %Paso 2: Se halla el delta
    delta = inv(hessiana)*gradiente';
    %Paso 3: Desplazamiento en dirección opuesta al delta
    x = x - delta'; 
    xk(cont,:)=x;
    cont = cont+1;
end

%% Grafica
figure;
xx = [-50:1:50];
yy = [-50:1:50];
for i=1:length(xx)
    for j=1:length(yy)
fxy(i,j) = funcion([xx(i),yy(j)]);
    end
end
xx1 = xk(:,1);
yy1 = xk(:,2);
for i=1:length(xx1)
    for j=1:length(yy1)
    fxy1(i,j) = funcion([xx1(i),yy1(j)]);
    end
end
surface(xx,yy,fxy);
hold on;
scatter(xk(:,1),xk(:,2), 'r')
axis([-50 50 -50 50 0 7000000])
set (gca,'fontsize',12); 
title ('Método de Newton - Dos variables');
xlabel ('x');
ylabel ('y');
zlabel ('z');
legend('Función','Iteraciones')



