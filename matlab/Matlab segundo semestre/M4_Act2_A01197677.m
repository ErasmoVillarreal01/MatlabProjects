clc; clear; close all;
%Erasmo Villarreal Sánchez A01197677
%Ejercicio 1 a
t = 1:.1:100;
x = 1-2*t;
y = 3+t;
z = -1+t;
%plot3(x,y,z)
xlabel("Valores de x"); 
ylabel("Valores de y"); 
zlabel("Valores de z");
grid on

%Ejercicio 1 b
a = 2;
b = 2;
xb = a*cos(t);
yb = b*sin(t);
zb = t;
%plot3(xb,yb,zb)
xlabel("Valores de x"); 
ylabel("Valores de y"); 
zlabel("Valores de z");
grid on

%Ejercicio 2 
a = 3;
x2 = a*(t-sin(t));
y2 = a*(1-cos(t));
%plot(x2,y2)
xlabel("Valores de x"); 
ylabel("Valores de y"); 
grid on

%Ejercicio 3
syms r x(t) y(t)
x= 5*cos(r)-cos(5*r);
y= 5*sin(r)-sin(5*r);
L = double(int(sqrt((diff(x))^2+(diff(y))^2),0,6.2832));
disp(L)
fplot(x,y,[0 6.2832])
xlabel("Valores de x"); 
ylabel("Valores de y"); 
grid on
