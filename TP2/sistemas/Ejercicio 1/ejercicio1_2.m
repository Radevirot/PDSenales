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
% Causalidad: Causal (depende solo de valores actuales de x)
% Linealidad: No lineal
y1_2 = sist1_ej1tp2(x2, 2, 0.5, 1/10);
y1_comblineal = sist1_ej1tp2((alpha.*x1+beta.*x2), 2, 0.5, 1/10);
if isequal(alpha.*y1+beta.*y1_2, y1_comblineal)
  disp('Sistema 1 lineal')
else
  disp('Sistema 1 no lineal')
endif
% Invarianza temporal:
y1_desplazado = sist1_ej1tp2(x1_desplazado, 2, 0.5, 1/10); %meto el desplazado en el sistema
y1_esperado = [zeros(1,desp), y1(1:end-desp)]; %desplazo la salida original
if isequal(y1_desplazado(desp+1:N),y1_esperado(desp+1:N)) %comparo las salidas después del padding
  disp('Sistema 1 invariante en el tiempo')
else
  disp('Sistema 1 NO invariante en el tiempo')
endif
% ¿Posee memoria? : No


y2 = sist2_ej1tp2(x1, 9);
% 2)
% Causalidad: No causal (depende de valores futuros de x)
% Linealidad: Lineal
y2_2 = sist2_ej1tp2(x2, 9);
y2_comblineal = sist2_ej1tp2((alpha.*x1+beta.*x2), 9);
if isequal(alpha.*y2+beta.*y2_2, y2_comblineal)
  disp('Sistema 2 lineal')
else
  disp('Sistema 2 no lineal')
endif
% Invarianza temporal:
y2_desplazado = sist2_ej1tp2(x1_desplazado, 9); %meto el desplazado en el sistema
y2_esperado = [zeros(1,desp), y2(1:end-desp)]; %desplazo la salida original
if isequal(y2_desplazado(desp+1:N),y2_esperado(desp+1:N)) %comparo las salidas después del padding
  disp('Sistema 2 invariante en el tiempo')
else
  disp('Sistema 2 NO invariante en el tiempo')
endif
% ¿Posee memoria? : Sí (depende de valores anteriores de x)


y3 = x1+2;
% 3)
% Causalidad: Causal (depende solo de valores actuales de x)
% Linealidad: No lineal
y3_2 = x2+2;
y3_comblineal = (alpha.*x1+beta.*x2)+2;
if isequal(alpha.*y3+beta.*y3_2, y3_comblineal)
  disp('Sistema 3 lineal')
else
  disp('Sistema 3 no lineal')
endif
% Invarianza temporal:
y3_desplazado = x1_desplazado+2; %meto el desplazado en el sistema
y3_esperado = [zeros(1,desp), y3(1:end-desp)]; %desplazo la salida original
if isequal(y3_desplazado(desp+1:N),y3_esperado(desp+1:N)) %comparo las salidas después del padding
  disp('Sistema 3 invariante en el tiempo')
else
  disp('Sistema 3 NO invariante en el tiempo')
endif
% ¿Posee memoria? : No


y4 = n.*x1;
% 4)
% Causalidad: Causal (depende solo de valores actuales de x)
% Linealidad: Lineal
y4_2 = m.*x2;
y4_comblineal = n.*(alpha.*x1+beta.*x2);
if isequal(alpha.*y4+beta.*y4_2, y4_comblineal)
  disp('Sistema 4 lineal')
else
  disp('Sistema 4 no lineal')
endif
% Invarianza temporal:
y4_desplazado = n.*x1_desplazado; %meto el desplazado en el sistema
y4_esperado = [zeros(1,desp), y4(1:end-desp)]; %desplazo la salida original
if isequal(y4_desplazado(desp+1:N),y4_esperado(desp+1:N)) %comparo las salidas después del padding
  disp('Sistema 4 invariante en el tiempo')
else
  disp('Sistema 4 NO invariante en el tiempo')
endif
% ¿Posee memoria? : No


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


