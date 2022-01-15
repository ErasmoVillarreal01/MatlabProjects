
syms x;
%puntos de la grafica
x1=30; y1=230;
x4=260; y4=80;
x3=99; y3=210;
x2=204; y2=79;
%Metodo para sacar los coeficientes de la ecuaciÃ³n de la grÃ¡fica
aMatriz = [x1.^3 x1.^2 x1 1; 
           x2.^3 x2.^2 x2 1; 
           x3.^3 x3.^2 x3 1; 
           x4.^3 x4.^2 x4 1];
zCol = zeros(4,1);
yCol = [y1;y2;y3;y4];
z=inv(aMatriz)*yCol;
%Vector del rango de la grÃ¡fica
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
%for para sacar el maximo y minimo en x
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
plot(pos,fun,'black')

hold on
center1 = [maximox maximoy-rcurvaturaMi];
center2 = [minimox minimoy+rcurvaturaMa];
%viscircles(center1,rcurvaturaMa)
%viscircles(center2,rcurvaturaMi)


%puntos críticos
puntosX=[0 0 0 0];
puntosY=[0 0 0 0];
vuelta = 0;
for i = pos
    puntoDerrape = ((1+(fun1(i)).^2).^(3/2))./(abs(fun2(i)));
    if (puntoDerrape > 49) &&(puntoDerrape <51 )
        
        %disp(puntoDerrape)
        y = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
        plot(i,y,'*')
        vuelta = vuelta+1;
        puntosX(vuelta)=i;
        puntosY(vuelta)=y;
    end
end
%aqui se resalta la zona de derrape
for i = puntosX(1):puntosX(2)
    curva1 = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
    plot(i,curva1,'*')
end
for i = puntosX(3):puntosX(4)
    curva1 = z(1)*i.^3 + z(2)*i.^2 + z(3)*i + z(4);
    plot(i,curva1,'*')
end

p1 = plot([218-50.62935444-(50.62935444/2) 218-50.62935444-(50.62935444/2) 80+218-50.62935444-(50.62935444/2) 80+218-50.62935444-(50.62935444/2) 218-50.62935444-(50.62935444/2)], [70.5625 10+70.5625 10+70.5625 70.5625 70.5625]);
rotate(p1, [0 0 1], -23.26770481, [218-50.62935444-(50.62935444/2) 70.5625 0])
p2 = plot([31-33.37610091  31-33.37610091  80+31-33.37610091  80+31-33.37610091 31-33.37610091], [230.7680 10+230.7680 10+230.7680 230.7680 230.7680]);
rotate(p2, [0 0 1], 36.81485408, [31-33.37610091 230.7680 0])

%para sacar esas de 50.22... y 33.37... distancias las cuales estan restando a x1 y a x2 se saco
%la tangente inversa de la pendiente para tener el angulo con el cual se
%puede despejar la hipotenusa con H = 20/sen(angulo) y así conseguimos la distancia

%Aquí se saca la recta tangente con la funcion rectaTangente de un punto en
%específico,  "pendiente" es para la primera zona de riesgo, y
%"pendiente2" es para la segunda zona de riesgo
%pendiente  = rectaTangente(puntosX,fun1,z);
%pendiente2  = rectaTangente(puntosX,fun1,z);

        annotation('textbox',[.2,.25,.2,.07],'String',q)
                annotation('textbox',[.13,.25,.07,.07],'String','L: ')
                annotation('textbox',[.33,.25,.07,.07],'String','m')
        annotation('textbox',[.2,.53,.2,.07],'String',rcurvaturaMa)
                annotation('textbox',[.13,.53,.07,.07],'String','RCMax: ')
                annotation('textbox',[.33,.53,.07,.07],'String','m')
        annotation('textbox',[.2,.6,.2,.07],'String',rcurvaturaMi)
                annotation('textbox',[.13,.6,.07,.07],'String','RCmin: ')
                annotation('textbox',[.33,.6,.07,.07],'String','m')
vInicial = input('velocidad inicial: ');
         annotation('textbox',[.2,.39,.2,.07],'String',vInicial)
         annotation('textbox',[.13,.39,.07,.07],'String','Vi: ')
         annotation('textbox',[.33,.39,.07,.07],'String','m/s')
pesoCarro = 746;%kg
coeficienteF = .7;
gravedad = 9.8;%m/s al cuadrado
Ff = (pesoCarro *gravedad)*coeficienteF;
a = Ff/pesoCarro;
energiaCalor = .5*(pesoCarro)*vInicial^2;

[velsMax2,velsMax1]=velocidadesMax(puntosX, fun1, fun2,vInicial,a,puntosX,z,pos,fun,q,energiaCalor,rcurvaturaMa,rcurvaturaMi);


function [velMax2,velMax1] = velocidadesMax(pos, fun1, fun2,vi, a,puntosX,z,pos2,fun,q,e,rMa,rMi) 
   primeraZona = [pos(1):pos(2)];
   segundaZona = [pos(3):pos(4)];
   rCurva1 = ((1+(fun1(primeraZona)).^2).^(3/2))./(abs(fun2(primeraZona)));
   rCurva2 = ((1+(fun1(segundaZona)).^2).^(3/2))./(abs(fun2(segundaZona)));
   velMax1 = sqrt((.7)*(9.8)*(rCurva1));
   velMax2 = sqrt((.7)*(9.8)*(rCurva2));
   count = 0;
   derrape = 0;
   distanciaMax=0;
   for i = velMax1
       count = count + 1;
       if vi > i
           distanciaMax = (i.^2)/(2*(.7)*(9.8));
           xf = distancia(vi,a,primeraZona(count),e,distanciaMax);
           rectaTangente(puntosX,fun1,z,primeraZona(count),xf);
           derrape = 1;
           break
       end
   end
   if derrape == 0
        animation(pos2,fun,q,vi,e,distanciaMax,rMa,rMi)
   end
end

function xf = distancia(vi,a,xi,e,dm)
annotation('textbox',[.2,.32,.2,.07],'String',e)
        annotation('textbox',[.13,.32,.07,.07],'String','E: ')
        annotation('textbox',[.33,.32,.07,.07],'String','J')
annotation('textbox',[.2,.46,.2,.07],'String',dm)
        annotation('textbox',[.13,.46,.07,.07],'String','DisMax: ')
        annotation('textbox',[.33,.46,.07,.07],'String','m')
xf = ((vi.^2)./a)+xi;
end

function [pendiente] = rectaTangente(puntosX,fun1,z, xi, xf)
    syms x
    if xi >= puntosX(1) && xi<=puntosX(2)
        pendiente = fun1(xi);
        yFuncionOriginal = z(1)*xi.^3 + z(2)*xi.^2 + z(3)*xi + z(4);
        yTan =@(x) pendiente*(x-xi)+(yFuncionOriginal);
        x1 = [xi:xf];
        y = yTan(x1); 
        plot(x1,y)
        
    elseif xi >= puntosX(3) && xi<=puntosX(4)
        pendiente = fun1(xi);
        yFuncionOriginal = z(1)*xi.^3 + z(2)*xi.^2 + z(3)*xi + z(4);
        yTan =@(x) pendiente*(x-xi)+(yFuncionOriginal);
        x1 = [xi:xf];
        y = yTan(x1);
        plot(x1,y)
    else
        disp('valor invalido');
        pendiente = 0;
    end
end
function animation(pos,fun,q,vi,e,dm,ma,mi)

for i = 1:length(pos)
    clf
    plot(pos,fun,'black')
    hold on
        p1 = plot([218-50.62935444-(50.62935444/2) 218-50.62935444-(50.62935444/2) 80+218-50.62935444-(50.62935444/2) 80+218-50.62935444-(50.62935444/2) 218-50.62935444-(50.62935444/2)], [70.5625 10+70.5625 10+70.5625 70.5625 70.5625]);
        rotate(p1, [0 0 1], -23.26770481, [218-50.62935444-(50.62935444/2) 70.5625 0])
        p2 = plot([31-33.37610091  31-33.37610091  80+31-33.37610091  80+31-33.37610091 31-33.37610091], [230.7680 10+230.7680 10+230.7680 230.7680 230.7680]);
        rotate(p2, [0 0 1], 36.81485408, [31-33.37610091 230.7680 0])
        title('Pista F1')
        annotation('textbox',[.2,.25,.2,.07],'String',q)
        annotation('textbox',[.13,.25,.07,.07],'String','L: ')
        annotation('textbox',[.33,.25,.07,.07],'String','m')
        annotation('textbox',[.2,.32,.2,.07],'String',0)
        annotation('textbox',[.13,.32,.07,.07],'String','E: ')
        annotation('textbox',[.33,.32,.07,.07],'String','J')
        annotation('textbox',[.2,.39,.2,.07],'String',vi)
        annotation('textbox',[.13,.39,.07,.07],'String','Vi: ')
        annotation('textbox',[.33,.39,.07,.07],'String','m/s')
        annotation('textbox',[.2,.46,.2,.07],'String',dm)
        annotation('textbox',[.13,.46,.07,.07],'String','DisMax: ')
        annotation('textbox',[.33,.46,.07,.07],'String','m')
        annotation('textbox',[.2,.53,.2,.07],'String',ma)
        annotation('textbox',[.13,.53,.07,.07],'String','RCMax: ')
        annotation('textbox',[.33,.53,.07,.07],'String','m')
        annotation('textbox',[.2,.6,.2,.07],'String',mi)
        annotation('textbox',[.13,.6,.07,.07],'String','RCmin: ')
        annotation('textbox',[.33,.6,.07,.07],'String','m')
        plot(pos(i),fun(i),'r-*')
        pause(0.05)
end
end
