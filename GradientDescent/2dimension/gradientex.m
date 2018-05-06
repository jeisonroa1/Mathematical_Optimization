function [dx dy] = gradientex(x,y)
dx = 4*x*(x^2+y-11)+1;
dy = 4*y+2*x^2-22;
end