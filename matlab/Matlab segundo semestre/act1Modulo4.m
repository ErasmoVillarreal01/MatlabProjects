%Erasmo Villarreal Sánchez A01197677

%ejercicio 1
t = -100:1:100;
x = t.^2-t.*2;
y = t+1;
z=t;
%plot3(x,y,z)

%ejercicio 2
x2 = t.^3 - 4.*t;
y2 = t.^2 - 4;
z2 = t;
%plot3(x2,y2,z2)

%ejercicio 3
a = 1;
b = 1;
t = 0:.1:pi*2;
u = 0:.1:pi*2;
x3 = a.*cos(t).*cos(u);
y3 = b.*cos(t).*sin(u);
z3 = (cos(t)).^2;
plot3(x3,y3,z3)

