%Examen Final Bárbara Martínez A01197915
syms x
x = input('Introduce el numero a calcular: ');
plotear(x)
function vectorGuardar =plotear(x)
    if x<100 || x>150
       disp('el numero no esta en el rango, intenta de nuevo')
    else
        ecuacion = @(x)sin(x.*4)./cos(x.*5);
        vector = [1:x];
        vectorGuardar = zeros(x);
        vectorGuardar = ecuacion(vector);
        plot(vector,vectorGuardar)
    end 
end

