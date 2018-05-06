function [f] = Goldenfuncion(alfa,x,derivada)
x = x + alfa*derivada;
f = (x(1)^2+x(2)-11)^2 + (x(2)^2+x(1)-7);
end