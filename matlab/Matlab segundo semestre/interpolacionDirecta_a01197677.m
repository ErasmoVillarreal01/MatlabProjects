%Erasmo Villarreal Sánchez A01197677
%Modelación de la Ingeniería con matemática computacional
%9am - 1pm

%Ejercicio 1
%variables que usaré en los ejercicios
x1= 2.20;  y1=0;
x2= 1.28;  y2=0.88;
x3= 0.66;  y3=1.14;
x4= 0;     y4 = 1.20;
x5= -0.60; y5 = 1.04;
x6= -1.04; y6 = 0.60;
x7= -1.20; y7 = 0;

%preparo la matriz para sustituir los valores de arriba en su lugar
%correspondiente
aMatriz = [1 x1 x1.^2; 
           1 x2 x2.^2; 
           1 x3 x3.^2];

%Hago la matriz de la B como lo vimos en clase pero yo la llamé yCol
yCol = [y1;y2;y3];

%para no confunfirme con el eje x lo llamaré z, aquí es donde se encuentran
%los coeficientes de la función, invirtiendo la matriz
z=inv(aMatriz)*yCol;
%se imprime la función con todo y coeficientes
fprintf("La ecuación es y=%fx^2+%fx+%f",z(3),z(2),z(1))
%preparo el dominio de la función para poder graficarlo en x_plot
x_plot=linspace(x1,x3,100);
%escribo la función cuadrática
y_plot= z(3)*(x_plot).^2 + z(2)*x_plot + z(1);
%aquí grafico la función y los puntos utilizados
plot(x_plot,y_plot,"green*")
hold on
plot(x1,y1,"ro")
plot(x2,y2,"ro")
plot(x3,y3,"ro")


%%Ejercicio 2

%aquí preparo la matriz con los valores anteriormente asignados a las
%variables
bMatriz = [1 x1 x1.^2 x1.^3 x1.^4 x1.^5 x1.^6; 
           1 x2 x2.^2 x2.^3 x2.^4 x2.^5 x2.^6; 
           1 x3 x3.^2 x3.^3 x3.^4 x3.^5 x3.^6;
           1 x4 x4.^2 x4.^3 x4.^4 x4.^5 x4.^6; 
           1 x5 x5.^2 x5.^3 x5.^4 x5.^5 x5.^6; 
           1 x6 x6.^2 x6.^3 x6.^4 x6.^5 x6.^6;
           1 x7 x7.^2 x7.^3 x7.^4 x7.^5 x7.^6;
           ];
       
%preparo la matriz B
yCol2 = [y1;y2;y3;y4;y5;y6;y7];
disp(' ')
%para no confunfirme con el eje x lo llamaré z, aquí es donde se encuentran
%los coeficientes de la función, invirtiendo la matriz
z2=inv(bMatriz)*yCol2;

%se imprime la función con todo y coeficientes
fprintf("La ecuación es y=%fx^6+%fx^5+%fx^4+%fx^3+%fx^2+%fx+%f",z2(7),z2(6),z2(5),z2(4),z2(3),z2(2),z2(1))
x_plot2=linspace(x1,x7,100);
y_plot2= z2(7)*(x_plot2).^6 +z2(6)*(x_plot2).^5 +z2(5)*(x_plot2).^4 +z2(4)*(x_plot2).^3 +z2(3)*(x_plot2).^2 + z2(2)*x_plot2 + z2(1);

%aquí se grafica la función y los puntos utilizados
plot(x_plot2,y_plot2,"b*")
plot(x1,y1,"ro")
plot(x2,y2,"ro")
plot(x3,y3,"ro")
plot(x4,y4,"ro")
plot(x5,y5,"ro")
plot(x6,y6,"ro")
plot(x7,y7,"ro")
hold off   
 

