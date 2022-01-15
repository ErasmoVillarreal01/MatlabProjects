clear; close all; clc;
%posicion de las particulas
%NEGATIVA
p1x=input("introduce la coordenada en X de la carga 1: ") ;
p1y=input("introduce la coordenada en Y de la carga 1: ") ;
w = .4;
%POSITIVA
p2x=input("introduce la coordenada en X de la carga 2: ") ;
p2y=input("introduce la coordenada en Y de la carga 2: ") ;

%Campo electrico
Q1 = input("introduce la carga 1 en C: ");
Q2 = input("introduce la carga 2 en C: ");

axis equal 
grid on

%crear puntos
[punto_derecha,punto_izquierda] = acomodar(p1x,p2x);
[punto_arriba,punto_abajo] = acomodar(p1y,p2y);


% Posicion de los vectores

minX = punto_izquierda-2;
maxX = punto_derecha+2;
minY = punto_abajo-2;
maxY = punto_arriba+2;
y_rango = linspace(minY,maxY,maxY-minY);
x_rango = linspace(minX,maxX,maxX-minX);
[x_quiver,y_quiver] = meshgrid(x_rango,y_rango);

K = 9e9; %constante
Rx = x_quiver - p1x; %la distancia que hay de la cordenada de la carga a al punto del grid
Ry = y_quiver - p1y;
R = sqrt(Rx.^2+Ry.^2).^3; 
Ex = K.*Q1.*Rx./R;
Ey = K.*Q1.*Ry./R;
Rx = x_quiver - p2x;
Ry = y_quiver - p2y;
R = sqrt(Rx.^2+Ry.^2).^3;
Ex =Ex+ K.*Q2.*Rx./R;
Ey =Ey+ K.*Q2.*Ry./R;
E=sqrt(Ex.^2 + Ey.^2);

%componentes x y de los vectores
u = Ex./E;
v = Ey./E;

hold on
h=quiver(x_quiver,y_quiver,u,v);
circulos(p1x,p1y,Q1)
circulos(p2x,p2y,Q2)

function circulos(punto1_x,punto1_y,carga_punto1)
x = punto1_x-0.5:0.01:punto1_x+0.5;

ymas = (0.5^2 - (x - punto1_x ).^2).^0.5 + punto1_y;
ymenos = -(0.5^2 - (x - punto1_x ).^2).^0.5 + punto1_y;

if carga_punto1 > 0
    color = 'red';
    
    else 
    color = 'blue';  
end

patch(x,ymas,color)
patch(x,ymenos, color)
end
function [p,q] = acomodar(p1,p2)
    if (p2-p1) > 0 
        p = p2;
        q = p1;  
    else 
        p = p1;
        q = p2;  
    end
end