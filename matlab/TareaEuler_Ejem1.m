clc
clear
close all
% Erasmo Villarreal, José Romo, Emilio Bernal, Ian Odria, Gabriela Gallardo 
%Varibles iniciales
x0 = 0;
y0 = 2;
xf = 1;
dt = 0.1;


%Creamos vector
x = [x0:dt:xf];

%Método Euler
ye = zeros;
ye(1) = y0;

%Ciclo que utiliza el valor anterior para calcular el nuevo 
for i = 1:length(x)-1
    ye(i+1) = ye(i) + (x(i) - ye(i) + 2) * dt;
end

plot(x,ye)
grid on
legend('Euler')

