%Método de Runge Kutta 4to orden
%Erasmo Villarreal Sánchez

f = @(x,y) -y + sin(x); %Aquí cambias la función e inicializas las variables
%f =  @(x,y) y.*tan(x)+x; %% SE COMENTA O SE DESCOMENTA LAS QUE SE VAYAN A
%USAR
%f =  @(x,y) (3.*x)./y-x.*y;
%f =  @(x,y) y.*cos(x);
y0 = input("Condicion inicial y(x0) = ");
x0 = input("Primer punto x0 = ");
x1 = input("Segundo punto x1 = ");
h = input("Con pasos de h = ");
[x,y] = RK4(f,x0,x1,y0,h);
[x3,y3] = RK2(f,x0,x1,y0,h);
hold on
f2=@(x) 1.5 * exp(-x)+0.5*sin(x)-0.5*cos(x); %Aquí cambias las funciones exactas
%f2= @(x) x.*tan(x)+2.*sec(x).*6+1;
%f2= @(x) sqrt(3+exp(-x.^2));
%f2= @(x) exp(sin(x));

y2 = f2(x); %aquí se evalua la exacta
plot(x,y2,'r o') %se grafica la exata
plot(x3,y3,'-g') %se grafica rk2 la cual no se ve porque está muy parecida a rk4
plot(x,y,'b *') %se grafica rk4

%se pone todo lo necesario para la grafica
title('Método de Runge-Kutta 4to orden')
xlabel('x')
ylabel('y')
legend('Exacta','RK2','RK4')
disp('    x     RK4     Exacta')
disp([x' y' y2'])

%aqui se guardan los promedios de los valores de rk2 y rk4
hold off
function [x,y] = RK4(f,x0,x1,y0,h)
   x = x0:h:x1;
   n = length(x);
   y = zeros(1,n);
   y(1) = y0;
   for i = 1:n-1
       k1 = h * f(x(i),y(i));
       k2 = h * f((x(i)+(h/2)),(y(i)+((1/2)*k1)));
       k3 = h * f((x(i)+(h/2)),(y(i)+((1/2)*k2)));
       k4 = h * f((x(i)+h),(y(i)+(k3)));
       y(i+1) = y(i)+(1/6)*(k1+2*k2+2*k3+k4);
   end
end

function [x,y] = RK2(f,x0,x1,y0,h)
   x = x0:h:x1;
   n = length(x);
   y = zeros(1,n);
   y(1) = y0;
   for i = 1:n-1
       k1 = h * f(x(i),y(i));
       k2 = h * f((x(i)+(h/2)),(y(i)+((1/2)*k1)));
       y(i+1) = y(i) +k2;    
   end
end