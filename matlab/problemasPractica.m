x=0:pi/10:2*pi;
y1 = sin(x);
y2 = sin(x-0.25);
plot(x,y1,'r-.x',x,y2,'b--*')
title('Ejemplo')
xlabel('eje x')
ylabel('eje y')
legend('y1=sin(x)','y2=sin(x-0.25)')
