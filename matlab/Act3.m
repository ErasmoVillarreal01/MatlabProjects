%{
%%ejercicio 2

v = [55:5:480]
n = numel(v)
u = sqrt(v)
trns1 = u'
trns2 = v'
q = n*v
s = times(u,v)
t = rdivide(u,v)
sumaTotal = sum(q)
maximo = max(t)
minimo = min(t)
z = [sumaTotal; maximo; minimo]


%%ejercicio 6 
x = -10:0.1:10;
y = x.^2;
plot(x,y,'red')
xlabel('x axis')
ylabel('y axis')
legend('x^2')
title('Grafica ejercicio 6')


%%ejercicio 7 
x = -10:0.1:10;
y = 100 *sin(x);
plot(x,y,'b')
xlabel('x axis')
ylabel('y axis')
legend('100sin(x)')
title('grafica ejercicio 7')


%%ejercicio 8

x = -10:0.1:10;
y = 100*cos(x);
plot(x,y,'green')
xlabel('x axis')
ylabel('y axis')
legend('100cos(x)')
title('grafica ejercicio 8')


%%ejercicio 9

x=-10:0.1:10;
y=((x.^3)+(x.^2)+x)/10;
plot(x,y,'black')
xlabel('x axis')
ylabel('y axis')
legend('((x^3)+(x^2)+x)/10')
title('grafica ejercicio 9')

%%ejercicio 10
    %%grafica 1
for i=1:20
    T(i)=(i-10).^2;
    plot(T,'red');
    xlabel('x axis')
    ylabel('y axis')
    legend('x^2')
    title('Grafica ejercicio 6')

    drawnow;
    pause(0.1)
end
    %%grafica 2
for i=1:20
    T(i)= 100 *sin(i-10);
    plot(T,'b');
    xlabel('x axis')
    ylabel('y axis')
    legend('100sin(x)')
    title('grafica ejercicio 7')
    drawnow;
    pause(0.1)
end
    %%grafica 3
for i=1:20
    T(i)= 100*cos(i-10);
    plot(T,'green');
    xlabel('x axis')
    ylabel('y axis')
    legend('100cos(x)')
    title('grafica ejercicio 8')
    drawnow;
    pause(0.1)
end
    %%grafica 4
for i=1:20
    T(i)= (((i-10).^3)+((i-10).^2)+(i-10))/10;
    plot(T,'black');
    xlabel('x axis')
    ylabel('y axis')
    legend('((x^3)+(x^2)+x)/10')
    title('grafica ejercicio 9')
    drawnow;
    pause(0.1)
end


%%ejercicio 11
hold on

%%ejercicio 6 

x1 = -10:0.1:10;
y1 = x1.^2;
plot(x1,y1,'red')
xlabel('x axis')
ylabel('y axis')

%%ejercicio 7 

x2 = -10:0.1:10;
y2 = 100 *sin(x2);
plot(x2,y2,'b')
xlabel('x axis')
ylabel('y axis')

%%ejercicio 8

x3 = -10:0.1:10;
y3 = 100*cos(x3);
plot(x3,y3,'green')
xlabel('x axis')
ylabel('y axis')

%%ejercicio 9

x4=-10:0.1:10;
y4=((x4.^3)+(x4.^2)+x4)/10;
plot(x4,y4,'black')
xlabel('x axis')
ylabel('y axis')
legend('x^2 rojo, 100*sin(x) azul, 100*cos(x) verde,((x^3)+(x^2)+x)/10 negro,')
legend('x^2 rojo, 100*sin(x) azul, 100*cos(x) verde,((x^3)+(x^2)+x)/10 negro,')

title('grafica ejercicios 6,7,8 y 9')
hold off


%%problema 12.
%a
x=[.033:.033:.462];
y1=[.0813,.1519,.2118,.2610,.2996,.3275,.3448,.3513,.3472,.3325,.3070,.2709,.2241,.1666];
scatter(x,y1,'black')
xlabel('x axis')
ylabel('y axis')
title('Grafica ejercicio 12')

v = 0:0.01:0.55;
vy2= (-4.899*v.^2) + (2.624*v);
hold on
%b y %c

y2= (-4.899*x.^2) + (2.624*x);
plot(x,y2,'red')

v = 0:0.1:0.55;
vy2= (-4.899*v.^2) + (2.624*v);
plot(v,vy2,'green')
scatter(v,vy2,'black')
legend('posicion vs tiempo','y=-4.899x^2 + 2.624x')

hold off
%}
