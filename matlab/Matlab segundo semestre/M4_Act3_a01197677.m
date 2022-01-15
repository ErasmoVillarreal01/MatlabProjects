syms x

max=15000;
err = 10^-5;

%en algunos cambian los intervalos seleccionados
disp('x-cos(x)')
f1= x-cos(x);
f11=@(x) x-cos(x);
mb(.6,.9,f11,err,max)
nR(f1,0,err,max)

disp('x*(exp(x))-1')
f2= x*(exp(x))-1;
f22= @(x) x*(exp(x))-1;
mb(0,1,f22,err,max)
nR(f2,0,err,max)

disp('x*(log10(x))-1.2')
f3= x*(log10(x))-1.2;
f33=@(x) x*(log10(x))-1.2;
mb(2.6,2.9,f33,err,max)
nR(f3,2,err,max)

disp('exp(.3*x)-x^2+4')
f4=exp(.3*x)-x^2+4;
f44=@(x) exp(.3*x)-x^2+4;
mb(2.4,2.9,f44,err,max)
nR(f4,2,err,max)

disp('2*cos(x)-(sqrt(x)/2)-1')
f5=2*cos(x)-(sqrt(x)/2)-1;
f55=@(x) 2*cos(x)-(sqrt(x)/2)-1;
mb(.6,.9,f55,err,max)
nR(f5,.5,err,max)

function nR(f,pi,err,max)
    
    d = diff(f);
    d=inline(d);
    f=inline(f);
    ea=100;
    j=0;
    while (ea>err && j < max)
        xi=pi-(f(pi)/d(pi));
        ea=abs(((xi-pi)/xi)*100);
        pi=xi;
        j=j+1;
    end
    disp('raiz con Newton Raphson')
    disp(pi)
end

function mb(xI,xD,f,tol,max)
if f(xI)==0||f(xD)==0
    if f(xI)==0 
        xr=xI;
    else
        xr=xD;
    end
else
    if f(xI)*f(xD)<0
        xM=(xI+xD)/2;
        contador = 0;
        while abs(f(xM))>tol && contador < max
        xM=(xI+xD)/2;
        if f(xM)==0
           xr=xM;
        else
            if f(xI)*f(xM)<0
                xD=xM;
            else
                xI=xM;
            end
        end
        contador = contador +1;
        end
        xr=xM;
    else
        fprintf('Cambiar intervalo: No se puede garantizar que contenga una solución \n')
        xr='Intervalo Malo';
    end
end
    disp('raiz con Método Bisección')
    disp(xr)
end