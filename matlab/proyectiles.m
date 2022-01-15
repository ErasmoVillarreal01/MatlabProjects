clc 
clear all
close all

g = 9.8;

    Vo = input('ingrese la velocidad inicial: ');
    teta = input('ingrese el angulo: ');
    H = input('Ingrese la altura inicial: ');

    teta = teta*3.1416/180;

    t = ((Vo*sin(teta))+((Vo*sin(teta))^2+2*H*g)^0.5)/g;
    xmax = Vo*cos(teta)*t;
    ymax = H+((Vo*sin(teta))^2)/(2*g);

    t1 = (0:0.01:t);
    Y = H+(Vo*sin(teta)).*t1-(0.5*g).*(t1.^2);

    X=Vo*cos(teta).*t1;
    y2 = H+(tan(teta).*X)-(0.5*g/(Vo*cos(teta))^2).*(X.^2);

    figure(1),plot(t1,Y,'r')
    figure(2),plot(X,y2)
    hold on
