clear all; clc;

[x, t] = ondacuadrada(2, 0, 3, 10, 0.5, 0);
n = 0:length(x)-1;


y1 = sist1_ej1tp2(x, 2, 0.5, 1/10);
y2 = sist2_ej1tp2(x, 9);
y3 = x+2;
y4 = n.*x;

subplot(5,1,1)
stem(t,x)
title('Onda cuadrada')

subplot(5,1,2)
stem(t,y1)
title('Onda transformada 1')

subplot(5,1,3)
stem(t,y2)
title('Onda transformada 2')

subplot(5,1,4)
stem(t,y3)
title('Onda transformada 3')

subplot(5,1,5)
stem(t,y4)
title('Onda transformada 4')


