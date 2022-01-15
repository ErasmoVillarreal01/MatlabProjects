clc; clear; close all;
m = 1;
M = 1000; 
a = 1;
R = 0.0001;
z0 = 10;
zf = 0;
V = 0;
Tf = 2;
h = 0.1;
n = abs(Tf/h);
m0 = (4*pi)*10^-7;

ZV=[z0,V];
f = @(x,y)((-9.81*m)-((((M*m0)^2*a^4*9)/(4*R))*(x^2/(x^2+a^2)^5))*y)';
p = [];
v = [];

for i = 0:n:Tf
    k1 = [ZV(2),f(ZV(1),ZV(2))];
    k2 = [ZV(2) + n/2*k1(2), f(ZV(1)+k1(1)*(n/2),ZV(2)+(n/2)*k1(2))];
    k3 = [ZV(2) + n/2*k2(2), f(ZV(1)+k2(1)*(n/2),ZV(2)+(n/2)*k2(2))];
    k4 = [ZV(2) + n/2*k3(2), f(ZV(1)+k3(1)*(n/2),ZV(2)+(n/2)*k3(2))];
    ZV = ZV + (n/6) * (k1+2*k2+2*k3+k4);
    p = [p; (ZV(1))];
    v = [v; (ZV(2))];
    
end

plot(xx2,yy2);
title('Posición y Posicion vs Tiempo')
xlabel("t");
ylabel("Z y V");

t = 1:h:Tf+1;

plot(t,p); grid on;
title('Velocidad vs Tiempo')
xlabel("t");
ylabel("v");

%%
[xx,yy] = RK4(f,0,Tf,z0,h);

[xx2,yy2] = RK4(f,0,Tf,V,h);


hold on;
plot(xx,yy); grid on;
plot(xx2,yy2);
title('Posición y Posicion vs Tiempo')
xlabel("t");
ylabel("Z y V");



function [x,y] = RK4(f,x0,x1,y0,h)
   x = x0:h:x1;
   n = length(x);
   y = zeros(1,n);
   y(1) = y0;
   for i = 1:n-1
       k1 = h * f(x(i),y(i));
       k2 = h * f((x(i)+(h/2)),(y(i)+((1/2)*k1)));
       k3 = h * f((x(i)+(h/2)),(y(i)+((1/2)*k2)));
       k4 = h * f((x(i)+h),(y(i)+(k3)));
       y(i+1) = y(i)+(1/6)*(k1+2*k2+2*k3+k4);
   end
end