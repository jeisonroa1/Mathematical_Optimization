function [ddx, ddy, dxdy] = hessiana(x,y)
ddx = 12*x^2+4*y-44;
ddy = 4;
dxdy = 4*x;
end