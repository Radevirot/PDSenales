%[xt, t] = senoidal(A, tini, tfin, fm, fs, fase)
clear all; clc

[xt1, t] = senoidal(1, 0, 10, 60, 1, 0);
[xt2, t] = senoidal(1, 0, 10, 60, 1, 0);

figure;
subplot(3,2,1);
stem(t,xt1); title('Original');

disp('Señal de referencia:')
disp('Amplitud: 1 - Frecuencia: 1 - Fase: 0')
disp('')

printf("Producto interno entre señales iguales: %d\n", dot(xt1,xt2))
disp('')

disp('Señal 2:')
disp('Amplitud: 5 - Frecuencia: 1 - Fase: 0')
[xt2, t] = senoidal(5, 0, 10, 60, 1, 0);
subplot(3,2,2);
stem(t,xt2); title('Amplitud: 5 - Frecuencia: 1 - Fase: 0');
printf("Producto interno: %d\n", dot(xt1,xt2))
disp('')

disp('Señal 2:')
disp('Amplitud: 1 - Frecuencia: 5 - Fase: 0')
[xt2, t] = senoidal(1, 0, 10, 60, 5, 0);
subplot(3,2,3);
stem(t,xt2); title('Amplitud: 1 - Frecuencia: 5 - Fase: 0');
printf("Producto interno: %d\n", dot(xt1,xt2))
disp('')

disp('Señal 2:')
disp('Amplitud: 1 - Frecuencia: 0.2 - Fase: 0')
[xt2, t] = senoidal(1, 0, 10, 60, 0.2, 0);
subplot(3,2,4);
stem(t,xt2); title('Amplitud: 1 - Frecuencia: 0.2 - Fase: 0');
printf("Producto interno: %d\n", dot(xt1,xt2))
disp('')

disp('Señal 2:')
disp('Amplitud: 1 - Frecuencia: 1 - Fase: pi/4')
[xt2, t] = senoidal(1, 0, 10, 60, 1, pi/4);
subplot(3,2,5);
stem(t,xt2); title('Amplitud: 1 - Frecuencia: 1 - Fase: 60');
printf("Producto interno: %d\n", dot(xt1,xt2))
disp('')

disp('Señal 2:')
disp('Amplitud: 1 - Frecuencia: 1 - Fase: -pi')
[xt2, t] = senoidal(1, 0, 10, 60, 1, -pi);
subplot(3,2,6);
stem(t,xt2); title('Amplitud: 1 - Frecuencia: 1 - Fase: -143');
printf("Producto interno: %d\n", dot(xt1,xt2))
disp('')


% CONCLUSIONES
% El cambio de amplitud en la senoidal se ve reflejado en el producto
% punto modificando la escala del mismo, es decir, para la amplitud
% original de 1, el producto punto resultaba 300, mientras que con
% una amplitud de 5 resulta 300*5=1500.
%
% El cambio de frecuencia en la senoidal arroja resultados tan pequeños
% en el producto punto que incluso podríamos considerar que son 0, esto
% indica que el cambio de frecuencia de la senoidal hace que las señales
% sean muy "diferentes" según el producto punto.
%
% El cambio de fase es medible con el producto punto, arroja resultados
% coherentes. Si coincidimos el ángulo en el que se invierte podemos
% obtener el mismo resultado que utilizando amplitud -1.
%

% Pareciera que el producto punto de cierta forma mide la distancia en Y entre
% cada uno de los puntos de ambas gráficas, si en general todos los puntos
% se encuentran demasiado alejados uno de los otros, el resultado estará
% más cerca del cero (cuando más cerca está es cuando están en extremos opuestos)






