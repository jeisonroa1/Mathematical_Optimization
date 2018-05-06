function [alfaoptimo] = Golden(xx,derivada)

%% Optimización Busqueda Dorada
%% Jeison Ivan Roa Mora 

%% Inicialización
lmin=0.1; % Criterio de convergencia
R=0.3819;  % Relación dorada
a = 0;    % Valores iniciales. Rango de busqueda.
b = 10;
%% Inicio Algoritmo
c = a + (b-a)*R;
d = b - (b-a)*R;
fc = Goldenfuncion(c,xx,derivada);
fd = Goldenfuncion(d,xx,derivada);
while (b-a)>lmin
    
    if fc < fd
        b = d;
        d = c;
        c = a + (b-a)*R;
        fd = fc;
        fc = Goldenfuncion(c,xx,derivada);
    else
        a = c;
        c = d;
        d = b - (b-a)*R;
        fc = fd;
        fd = Goldenfuncion(d,xx,derivada);
    end
end
alfaoptimo = (a+b)/2;
end
