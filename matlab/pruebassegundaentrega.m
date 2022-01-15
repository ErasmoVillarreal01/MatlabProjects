clear;
clc;
syms x;
%puntos de la grafica
x1=30; y1=230;
x4=260; y4=80;
x3=99; y3=210;
x2=204; y2=79;
%Metodo para sacar los coeficientes de la ecuación de la gráfica
aMatriz = [x1.^3 x1.^2 x1 1; 
           x2.^3 x2.^2 x2 1; 
           x3.^3 x3.^2 x3 1; 
           x4.^3 x4.^2 x4 1];
zCol = zeros(4,1);
yCol = [y1;y2;y3;y4];
z=inv(aMatriz)*yCol;

%Vector del rango de la gráfica
pos=[30:260];

%funcion sin derivar
fun = z(1)*pos.^3 + z(2)*pos.^2 + z(3)*pos + z(4);
%%funcion para sacar longitud de arco
fun3 = @(x) sqrt(1+(3.*z(1).*x.^2 + 2.*z(2).*x + z(3)).^2); 
%%segunda derivada
fun2 = @(x) 6.*z(1).*x + 2.*z(2); 
%%primera derivada
fun1 = @(x) 3.*z(1).*x.^2 + 2.*z(2).*x + z(3); 

q = integral(fun3,30,260); %longitud de arco 
maximoy = max(fun); %maximo de la funcion
minimoy = min(fun); %minimo de la funcion
maximox = 0;
minimox = 0;

for i = pos 
    if z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4) == minimoy
        minimox = i;
    end
    if z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4) == maximoy
        maximox = i;
    end
end

%sacar radios de curvatura
rcurvaturaMa =  ((1+(fun1(maximox)).^2).^(3/2))./(-fun2(maximox));
rcurvaturaMi =  ((1+(fun1(minimox)).^2).^(3/2))./(fun2(minimox));

%Graficar los circulos del radio de curvatura en el punto maximo y minimo
%de la funcion
plot(pos,fun);
center1 = [maximox maximoy-rcurvaturaMi];
center2 = [minimox minimoy+rcurvaturaMa];
%viscircles(center1,rcurvaturaMa)
%viscircles(center2,rcurvaturaMi)


%puntos cr�ticos
puntosX=[0 0 0 0];
puntosY=[0 0 0 0];
vuelta = 0;
%31 y 218
for i = pos
    puntoDerrape = ((1+(fun1(i)).^2).^(3/2))./(abs(fun2(i)));
    if (puntoDerrape > 49) &&(puntoDerrape <51 )
        
        %disp(puntoDerrape)
        hold on
        y = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
        plot(i,y,'o')
        vuelta = vuelta+1;
        puntosX(vuelta)=i;
        puntosY(vuelta)=y;
    
    end
end

%aqui se resalta la zona de derrape
for i = puntosX(1):puntosX(2)
    curva1 = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
    plot(i,curva1,'o')
end
for i = puntosX(3):puntosX(4)
    curva1 = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
    plot(i,curva1,'o')
end
for i = puntosX(3): 400
    yFuncionOriginal = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
    yTan =@(x) -0.4300*(x-puntosX(3))+(yFuncionOriginal);
    x2 = [puntosX(3):puntosX(4)+40];
    yGrada2 = yTan(x2);
    primeraX = puntosX(3);
    segundaX = i;
    primeraY = yGrada2(1);
    segundaY = yTan(i);
    
    largo = sqrt((primeraX-segundaX).^2+(primeraY-segundaY).^2);
    if largo>79&&largo<81
        disp(segundaX)
        disp(largo)
    end
end

yFuncionOriginal = z(1)*puntosX(3).^3 + z(2)*puntosX(3).^2 + z(3)*puntosX(3) + z(4);
yTan =@(x) -0.4300*(x-puntosX(3))+(yFuncionOriginal);
x2 = [puntosX(3):puntosX(4)+22];
yGrada2 = yTan(x2);

hold on 
%plot(x1-41.72012614,yGrada1,'b')
%plot(x2-63.28669305,yGrada2,'b')
%pendiente  = rectaTangente(puntosX,fun1,z);
%pendiente2  = rectaTangente(puntosX,fun1,z);


function [pendiente] = rectaTangente(puntosX,fun1,z)
    syms x
    posicionX = input('introduce el valor en X de la recta tangente (primer es 31 y luego 218): ');
    if posicionX >= puntosX(1) && posicionX<=puntosX(2)
        pendiente = fun1(posicionX);
        yFuncionOriginal = z(1)*posicionX.^3 + z(2)*posicionX.^2 + z(3)*posicionX + z(4);
        yTan =@(x) pendiente*(x-posicionX)+(yFuncionOriginal);
        x1 = [puntosX(1):puntosX(2)];
        y = yTan(x1);
        hold on 
        plot(x1,y)
    elseif posicionX >= puntosX(3) && posicionX<=puntosX(4)
        pendiente = fun1(posicionX);
        yFuncionOriginal = z(1)*posicionX.^3 + z(2)*posicionX.^2 + z(3)*posicionX + z(4);
        yTan =@(x) pendiente*(x-posicionX)+(yFuncionOriginal);
        x1 = [puntosX(3):puntosX(4)];
        y = yTan(x1);
        hold on 
        plot(x1,y)
    else
        disp('valor invalido')
    end
end