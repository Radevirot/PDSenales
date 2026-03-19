[xt, t] = senoidal(1, 0, 1, 1000, 5, 0);
[xt1, t1] = senoidal(1, 0, 1, 100, 5, 0);
[xt2, t2] = senoidal(1, 0, 1, 25, 5, 0);
[xt3, t3] = senoidal(1, 0, 1, 10, 5, 0);
[xt4, t4] = senoidal(1, 0, 1, 4, 5, 0);
[xt5, t5] = senoidal(1, 0, 1, 1, 5, 0);
[xt6, t6] = senoidal(1, 0, 1, 0.5, 5, 0);

subplot(3,2,1);
stem(t1,xt1)
hold on
plot(t,xt,'r')
title('fm = 100')

subplot(3,2,2);
stem(t2,xt2)
hold on
plot(t,xt,'r')
title('fm = 25')

subplot(3,2,3);
stem(t3,xt3)
hold on
plot(t,xt,'r')
title('fm = 10')

subplot(3,2,4);
stem(t4,xt4)
hold on
plot(t,xt,'r')
title('fm = 4')

subplot(3,2,5);
stem(t5,xt5)
hold on
plot(t,xt,'r')
title('fm = 1')

subplot(3,2,6);
stem(t6,xt6)
hold on
plot(t,xt,'r')
title('fm = 0.5')


% Para las frecuencias de 100 Hz y 25 Hz se distingue perfectamente una
% sinusoidal de 5 ciclos, para la frecuencia de 10 Hz se pueden distinguir los
% ciclos pero no la forma sinusoidal de la onda, para fm = 4 pareciera que
% hay un único ciclo, y tanto para fm = 1 y fm = 0.5 ni siquiera se distingue
% que lo que se ve es una onda.

% La discrepancia ocurre porque la cantidad de muestras es suficiente para
% representar correctamente la función. Cualquier valor menor a 10 parece no
% poder representar correctamente los cinco ciclos. Asumo que se trata de la
% cantidad de raíces que contiene la gráfica (para este caso, siempre que la
% cantidad de samples sea mayor, se lograrán distinguir los cinco ciclos).








