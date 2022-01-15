clear all; clc;
syms x
f = x*log10(x)-1.2;
x1=.1;
x2 = 1;
err = .05;
ezplot(f), grid on
f = inline(f);
ea = 100;
i = 0;
fprintf('Iteración:      Raiz\n')
while ea>err
    xi = x2-(f(x2)*(x1-x2))/(f(x1)-f(x2));
    ea = abs(((xi-x2)/xi)*100);
    fprintf('%f      %8.4f\n',i,xi)
    x1=x2;
    x2=xi;
    i=i+1;
end
fprintf('\nRaíz de la función:%8.4f\n Calculada en %4.0f iteraciones\n',xi,i)

f2 = x-cos(x);
x1= 0;
x2 = 2;
err = .05;
%ezplot(f2), grid on
f2 = inline(f2);
ea = 100;
i = 0;
fprintf('Iteración:      Raiz\n')
while ea>err
    xi = x2-(f2(x2)*(x1-x2))/(f2(x1)-f2(x2));
    ea = abs(((xi-x2)/xi)*100);
    fprintf('%f      %8.4f\n',i,xi)
    x1=x2;
    x2=xi;
    i=i+1;
end
fprintf('\nRaíz de la función:%8.4f\n Calculada en %4.0f iteraciones\n',xi,i)


f = @(x) x.^3-4*x.^2+x+6;
%fplot(f,[-10,10]);
hold on; grid on;
p=[1 -4 1 6];
r = roots(p)


f2 = @(x) x.^3+15*x.^2+50*x-10098;
%fplot(f2,[-10,10]);
p2=[1 15 50 -10098];
r2 = roots(p2)


