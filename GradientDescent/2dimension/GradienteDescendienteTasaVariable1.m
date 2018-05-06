%% Metodo de Descenso de gradiente con tasa de aprendizaje variable - Optimización Matemática
%% Jeison Roa
%% Diego Barragan
clear all
close all
clc
%% Inicialización Variables

gradienteMin = 0.1;                               % Valor de precisión de la busqueda
a = -35;                                          % Intervalo de busqueda
b = 35;
rng('shuffle');                                   % Cambia la semilla para los numeros aleatorios
x = [a + (b-a)*rand(1,1), a + (b-a)*rand(1,1)];   % Punto inicial de busqueda aleatorio.
alfa = [];                                        % Tasa de aprendizaje.
[gradiente(1) gradiente(2)] = gradientex(x(1),x(2));                % Cálculo del gradiente
cont = 1;
xk(1,:) = x;
%% Inicio algoritmo 

while  norm(gradiente)>gradienteMin
%     %Paso 1: Se determina la dirección de busqueda calculando el
%     gradiente
      [gradiente(1) gradiente(2)] = gradientex(x(1),x(2));
      %Paso 2: Se encuentra la tasa de aprendizaje optima para la actualización
      alfa = Golden(x,gradiente);
      %Paso 3: Desplazamiento en dirección del gradiente
      x = x -(alfa*gradiente); 
      xk(cont+1,:)=x; % Se guarda el punto en cada iteración.
      cont = cont+1;
end

%% Grafica
figure;
xx = [-45:1:45];
yy = [-45:1:45];
for i=1:length(xx)
    for j=1:length(yy)
fxy(i,j) = funcion1([xx(i),yy(j)]);
    end
end
surface(xx,yy,fxy);
hold on;
scatter(xk(:,1),xk(:,2),'r');

set (gca,'fontsize',12); 
title ('Descenso de gradiente con tasa de aprendizaje variable - Dos Variables');
xlabel ('x');
ylabel ('y');
zlabel ('z');
legend('Función','Iteraciones')









