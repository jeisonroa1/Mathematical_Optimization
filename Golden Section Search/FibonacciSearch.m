%% Optimización: Busqueda Fibonacci
%% Jeison Ivan Roa Mora 
close all; clear all;
%% Serie de fibonacci
fib(1) = 1;
fib(2) = 1;
for i = 3 : 10000
    fib(i) = fib(i-1) + fib(i-2);
end

%% Inicialización

lmin=0.1; % Criterio de convergencia
a = 0;    % Valores iniciales. Rango de busqueda.
b = 7;
n = 2;    %Iteracion
R = fib(n)/fib(n+2);  % Relación Fibonacci
%% Inicio Algoritmo
c = a + (b-a)*R;
d = b - (b-a)*R;
fc = funcion(c);
fd = funcion(d);
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
n=n+1;
R = fib(n)/fib(n+2);    
end
optimo = (a+b)/2
n-2

%% Graficas

% x = [0:0.001:7];
% fx = (x-3).*x.^3.*(x-6).^4;
% figure;
% plot(x,fx);