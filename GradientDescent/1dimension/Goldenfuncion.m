function [f] = Goldenfuncion(alfa,x,derivada)
x = x + (alfa*derivada);
f = (x-3)*x^3*(x-6)^4;
end