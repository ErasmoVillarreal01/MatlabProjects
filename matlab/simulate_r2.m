% Emilio Bernal, Ian Odria, Erasmo Villarreal, Gabriela Gallardo, Jose Romo
height = input('Cual es la altura del volcan?\n');
diameter = input('Cual es el diametro del volcan?\n');
n = input('Cuantas trayectorias quieres simular?\n');
tabla = cell(1,n);
animatedLines = cell(1,n);
for ii=1:n
 init_x = (diameter/2 * -1) + diameter*rand(1,1);
 angle = randi([0,180],1);
 velocity = randi([1,50],1);
 tabla{ii} = trajectoryfunc(angle, velocity, height, init_x);
end
title('Reto F1004B');
xlabel('Desplazamiento en X');
ylabel('Desplazamiento en Y');
for j = 1:n
 animatedLines{j} = animatedline('Color',[randi([0,1],1) randi([0,1],1)
randi([0,1],1)]);
 t_max = floor(max(tabla{j}(:,3)));
 for l = 0:t_max
 x = tabla{j}(1 + 100*l,1);
 y = tabla{j}(1 + 100*l,2);
 addpoints(animatedLines{j}, x, y);
 drawnow;
 end
end
analisis = zeros(n,9);
for ii = 1:n
 if max(tabla{ii}(:,3)) ~= 0
 [analisis(ii,1), index] = max(tabla{ii}(:,2));
 analisis(ii,2) = min(tabla{ii}(:,3));
 analisis(ii,3) = tabla{ii}(index,3);
 analisis(ii,4) = tabla{ii}(index+1,3);
 analisis(ii,5) = max(tabla{ii}(:,3));
 analisis(ii,7) = max(tabla{ii}(:,3));
 analisis(ii,8) = max(tabla{ii}(:,2));
 analisis(ii,9) = max(tabla{ii}(:,1));
 else
 analisis(ii,1) = max(tabla{ii}(:,2));
 analisis(ii,8) = max(tabla{ii}(:,2));
 analisis(ii,9) = max(tabla{ii}(:,1));
 end
end
analisis_tabla = array2table(analisis, 'VariableNames', {'Punto critico', 'InicioCreciente (en segundos)', 'Final Creciente (en segundos)', 'Inicio Decreciente (ensegundos)', 'Final Decreciente (en segundos)', 'Inicio Concavidad Negativa (en segundos)', 'Final Concavidad Negativa (en segundos)', 'Altura Maxima','Desplazamiento Maximo'});
disp(analisis_tabla);
function trajectory = trajectoryfunc(angle,velocity, y_disp, x_disp)
 t = ((2 * velocity * sind(angle))/9.81) * randi([2,4],1);
 trajectory = zeros(ceil(t),3);
 index = 1;
 for ii = 0:0.01:t
 trajectory(index,1) = velocity * ii * cosd(angle) + x_disp; % Punto en x
 trajectory(index,2) = velocity * ii * sind(angle) - 0.5 * (9.81*ii^2) +
y_disp; % Punto en y
 trajectory(index,3) = ii; % Tiempo
 index = index + 1;
 end
end