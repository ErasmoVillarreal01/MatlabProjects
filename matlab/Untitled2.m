disp('-------ejercicio 4-----')
lado1 = input('(no la base) lado 1: ');
lado2 = input('(no la base) lado 2: ');
lado3 = input('(base) lado 3: ');
if lado1 == lado2 && lado2 == lado3
    disp('Es un triangulo equilátero');
end
if lado1 == lado2 && lado3~=lado1 && (lado1+lado2)>lado3
    disp('Es un triangulo isosceles');
end
if lado1 ~= lado2 && lado2~=lado3 && (lado1+lado2)>lado3
    disp('Es un triangulo escaleno');
end


disp('-------ejercicio 6-----')
x= -10:0.1:10;
y=100*sin(x);
plot(x,y,'r')
xlabel('eje x')
ylabel('eje y')
legend('100sin(x)')