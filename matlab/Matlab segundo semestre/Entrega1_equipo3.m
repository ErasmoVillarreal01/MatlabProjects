clear; close all; clc;
%crear el grid 
N = 20;
minX = -2; maxX=2;
minY = -2; maxY=2;
x = linspace(minX,maxX,N);
y = linspace(minY,maxY,N);
[xG,yG]=meshgrid(x,y);

%posicion de las particulas
%NEGATIVA
coordXn=input("introduce la coordenada en X de la carga 1: ") ;
coordYn=input("introduce la coordenada en Y de la carga 1: ") ;
w = .4;
%POSITIVA
coordXp=input("introduce la coordenada en X de la carga 2: ") ;
coordYp=input("introduce la coordenada en Y de la carga 2: ") ;

%Campo electrico
Qn = input("introduce la carga 1 en C: ");
Qp = input("introduce la carga 2 en C: ");
K = 9e9; %constante
Rx = xG - coordXn; %la distancia que hay de la cordenada de la carga a al punto del grid
Ry = yG - coordYn;
R = sqrt(Rx.^2+Ry.^2).^3; 
Ex = K.*Qn.*Rx./R;
Ey = K.*Qn.*Ry./R;
Rx = xG - coordXp;
Ry = yG - coordYp;
R = sqrt(Rx.^2+Ry.^2).^3;
Ex =Ex+ K.*Qp.*Rx./R;
Ey =Ey+ K.*Qp.*Ry./R;
E=sqrt(Ex.^2 + Ey.^2);

%componentes x y de los vectores
u = Ex./E;
v = Ey./E;

figure();
h=quiver(xG,yG,u,v);
h=rectangle('Position',[coordXn-w/2,coordYn-w/2,w,w],'Curvature',[1 1]);
set(h,'Facecolor',[0 0 1]);
h=rectangle('Position',[coordXp-w/2,coordYp-w/2,w,w],'Curvature',[1 1]);
set(h,'Facecolor',[1 0 0]);