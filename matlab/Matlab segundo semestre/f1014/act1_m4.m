%clc; clear; close all;
%syms y(x);
%eq1 = diff(y,x)== x-exp(2*x);
%condicion=y(0)==1;
%s = dsolve(eq1,condicion,x)
%for i= 1:5
%    x=i; 
%    y=eval(s); 
%    fprintf("valor de x=%0.4f valor de f=%.4f \n",x, y);
%    hold on 
%    plot(x,y,"*")
%end;
    
%clc; clear; close all;
%x = input("Valor de x = ");
%numIter = input("Número de iteraciones = ");
%fprintf("Valor analítico de exp(%0.2f)=%.4f \n", x,exp(x));
%acum=0; 
%for n= 0 : numIter-1
%    acum = acum + x^n / factorial(n);
%end
%fprintf("Valor de exp(%0.2f)=%.4f \n", x,acum);

clc; clear; close all;
fprintf("Solucion Ecuaciones Diferenciales por Runge Kutta de orden 2\n")
f = input("Ecuacion diferencial = ","s");
x0 = input("Primer punto x0 = ");
x1 = input("Segundo punto x1 = ");
y0 = input("Condicion inicial y(x0) = ");
n = input("Numero de pasos n = ");
h = (x1-x0)/n;
 
x0Inic = x0;

fprintf(' it x0 y(x1) \n ')
for i= 1: n
    it = i-1;
    x = x0; y = y0;
    K1 = h * eval(f);
    x = x + h/2; y = y + 1/2*K1;
    K2 = h*eval(f);
    y0 = y0 + K2;
    x0 = x0 + h;
    xx(i)= x0; yy(i)=y0;
 
    
    fprintf('%2.0f %10.6f %10.6f\n', it, x0,y0);
end
plot(xx,yy); hold on;
xlim([x0Inic x1]);

ezplot(f, [x0Inic, x1] )

