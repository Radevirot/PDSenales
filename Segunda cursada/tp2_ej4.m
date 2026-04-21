clear all; clc;

%me genero el delta de dirac discreto
d_dirac = zeros(1,10); d_dirac(1) = 1;
%tiempo cualquiera para graficar
t = 0:0.5:4.5;

y1 = sists_ej4tp2(d_dirac,'1');
y2 = sists_ej4tp2(d_dirac,'2');
y3 = sists_ej4tp2(d_dirac,'3');

subplot(3,1,1)
plot(t,y1)
title('Respuesta al impulso: Sistema 1')

subplot(3,1,2)
plot(t,y2)
title('Respuesta al impulso: Sistema 2')

subplot(3,1,3)
plot(t,y3)
title('Respuesta al impulso: Sistema 3')

