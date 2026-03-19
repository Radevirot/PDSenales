clear all; clc;
desp = 3;


[x1, t1] = ondacuadrada(2, 0, 3, 10, 0.5, 0);
x1_desplazado = [zeros(1, desp), x1(1:end-desp)]; % desplazo x1 "desp" veces, llenando con ceros.
[x2, t2] = ondacuadrada(3, 0, 3, 10, 1, 0);
n = 0:length(x1)-1;
m = 0:length(x2)-1;
alpha = 2;
beta = 3;
N = length(x1);



y1 = sist1_ej1tp2(x1, 2, 0.5, 1/10);
% 1)
% - Causalidad: Causal (depende solo de valores actuales de x)
% - Linealidad: Es lineal
% Aditividad:
% x1[n] -> g[n]*x1[n]
% x2[n] -> g[n]*x2[n]
% x1[n] + x2[n] -> g[n]*(x1[n] + x2[n]) -> (propiedad distributiva) g[n]*x1[n] + g[n]*x2[n]
% Multiplo escalar:
% a*x1[n] -> g[n]*(a*x[n]) -> a*g[n]*x[n]
% - Es variante en el tiempo, ya que depende de un seno, es decir, un desplazamiento
% en la entrada NO produce el mismo desplazamiento en la salida
% - ¿Posee memoria?: No


y2 = sist2_ej1tp2(x1, 9);
% 2)
% - Causalidad: No causal (depende de valores futuros de x)
% - Linealidad: Es lineal
% Aditividad:
% x1[n] -> g[n]*x1[n]
% x2[n] -> g[n]*x2[n]
% x1[n] + x2[n] -> g[n]*(x1[n] + x2[n]) -> (propiedad distributiva) g[n]*x1[n] + g[n]*x2[n]
% Multiplo escalar:
% a*x1[n] -> g[n]*(a*x[n]) -> a*g[n]*x[n]
% - Es invariante en el tiempo, ya que depende de coeficientes constantes.
% - ¿Posee memoria? : Sí (depende de valores anteriores de x)


y3 = x1+2;
% 3)
% - Causalidad: Causal (depende solo de valores actuales de x)
% - Linealidad: NO es lineal
% Aditividad:
% x1[n] -> x1[n] +2
% x2[n] -> x2[n] +2
% x1[n] + x2[n] -> (x1[n] + x2[n]) + 2 => NO ES LINEAL
% - Es invariante en el tiempo.
% - ¿Posee memoria? : No


y4 = n.*x1;
% 4)
% - Causalidad: Causal (depende solo de valores actuales de x)
% - Linealidad: Es lineal
% Aditividad:
% x1[n] -> n*x1[n]
% x2[n] -> n*x2[n]
% x1[n] + x2[n] -> n*(x1[n] + x2[n]) -> (propiedad distributiva) => n*x1[n] + n*x2[n]
% Multiplo Escalar:
% a*x1[n] -> n*(a*x[n]) -> a*n*(x[n])
% - Es variante en el tiempo.
% - ¿Posee memoria? : No


subplot(5,1,1)
stem(t1,x1)
title('Onda cuadrada')



subplot(5,1,2)
stem(t1,y1)
title('Onda transformada 1')



subplot(5,1,3)
stem(t1,y2)
title('Onda transformada 2')



subplot(5,1,4)
stem(t1,y3)
title('Onda transformada 3')



subplot(5,1,5)
stem(t1,y4)
title('Onda transformada 4')


