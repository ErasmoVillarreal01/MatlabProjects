%Regresión Lineal por Minimos Cuadrados
%Erasmo Villarreal Sánchez A01197677

%Descomentar cada matriz cada matriz que se quiera usar
%En el la primera parte se usan diferentes X y Y porque estan acomodados de
%manera vertical en el documento los datos, y en la segunda parte estan de
%manera horizontal.

%%Parte 1 Ejericiio1
%Matriz = readmatrix('ejercicio_1.csv');
%X = Matriz(:,1); Y = Matriz(:,2);

%DESCOMENTAR LA MATRIZ QUE SE VAYA A USAR JUNTO CON LA LINEA 21, SIN ANTES
%COMENTAR LAS LINEAS 10 Y 11
%%Parte 2
%Matriz = readmatrix('PuntosXY.csv');
%Matriz = readmatrix('PuntosXY7.csv');
%Matriz = readmatrix('PuntosXY10.csv');
Matriz = readmatrix('PuntosXY3.csv');
X = Matriz(1,:);Y = Matriz(2,:);
[m,b] = minimosC(X,Y);
%donde se marcan los puntos
plot(X,Y,'.g','MarkerSize',15)
hold on
%donde se grafica la linea de regresion y se configura la gráfica
recta = m*X + b;
plot(X,recta, 'r');
xlabel('Valores de X')
ylabel('Valores de Y')
title(['m-' num2str(m) ' b-' num2str(b)])
legend('Datos','Linea que aproxima')


function [m,b] = minimosC(X,Y)
    n = numel(X);
    Sx = sum(X);
    Sy = sum(Y);
    xy = X.*Y;
    Sxy = sum(xy);
    xx = (X.*X);
    Sxx = sum(xx);
    m = (Sxy-((Sx*Sy)/n))/(Sxx-(((Sx)^2)/n));
    b = ((Sy)/n) - m*((Sx)/n);
end