clear all; clc;

% vamos a generar el conjunto base con el cual vamos a comparar todos
% nuestros resultados usando el producto interno.

% nuestro conjunto base son 10 senoidales cuyas frecuencias van de 1 a 10 hz.
% voy a elegir para todas que vayan de 0 a 3s y que la frecuencia de muestreo
% sea de 100hz.


for i=1:10
  xt = senoidal(1, 0, 3, 100, i, 0);
  xt_unitario = xt./norm(xt);
  conjunto_base(i,:)=xt;
  conjunto_base_unitario(i,:)=xt_unitario;
endfor

% ahora armamos un vector de alfas para la combinación lineal del inciso 1

alfas = [3 4 2 6 2 5 1 9 5 3];

% hago la combinación lineal

comb_lineal_1 = alfas*conjunto_base;
cl1_unitario = comb_lineal_1./norm(comb_lineal_1);

% calculo los productos internos entre los elementos del conjunto base y
% la combinación lineal calculada

for i=1:10
  PI_CL1(i) = dot(comb_lineal_1,conjunto_base(i,:));
  SIM_CL1(i) = dot(cl1_unitario,conjunto_base_unitario(i,:))
endfor

figure;
subplot(1,2,1)
bar(PI_CL1,'r');
xlabel('Frecuencias de las senoidales a comparar (Hz)');
ylabel('Valor del producto interno');
title('Producto interno entre conjunto base y combinación lineal 1')

subplot(1,2,2)
bar(SIM_CL1,'r');
xlabel('Frecuencias de las senoidales a comparar (Hz)');
ylabel('Valor de la similitud');
title('Similitud entre conjunto base y combinación lineal 1')

% ahora armamos un conjunto desfasado y calculamos otra combinación lineal, voy
% a usar los mismos alfas y el desfase de las senoidales será de 36 grados por
% cada i, recordemos que el ángulo de fase está en radianes.


for i=1:10
  xt = senoidal(1, 0, 3, 100, i, 36*i*(pi/180));
  conjunto_desfasado(i,:)=xt;
endfor

comb_lineal_2 = alfas*conjunto_desfasado;
cl2_unitario = comb_lineal_2./norm(comb_lineal_2);

% calculamos el producto interno entre la comb lineal y el conjunto base

for i=1:10
  PI_CL2(i) = dot(comb_lineal_2,conjunto_base(i,:));
  SIM_CL2(i) = dot(cl2_unitario,conjunto_base_unitario(i,:));
endfor

figure;
subplot(1,2,1)
bar(PI_CL2,'g');
xlabel('Frecuencias de las senoidales a comparar (Hz)');
ylabel('Valor del producto interno');
title('Producto interno entre conjunto base y combinación lineal 2 (desfasada)')

subplot(1,2,2)
bar(SIM_CL2,'g');
xlabel('Frecuencias de las senoidales a comparar (Hz)');
ylabel('Valor de la similitud');
title('Similitud entre conjunto base y combinación lineal 2 (desfasada)')

% generamos ahora una única onda cuadrada de 5,5Hz
% y calculamos el producto interno entre esta y los elementos del conjunto base

cuadrada = ondacuadrada(1, 0, 3, 100, 5.5, 0);
cuadrada_unitaria = cuadrada./norm(cuadrada);

for i=1:10
  PI_SQ(i) = dot(cuadrada,conjunto_base(i,:));
  SIM_SQ(i) = dot(cuadrada_unitaria,conjunto_base_unitario(i,:));
endfor

figure;
subplot(1,2,1)
bar(PI_SQ,'b');
xlabel('Frecuencias de las senoidales a comparar (Hz)');
ylabel('Valor del producto interno');
title('Producto interno entre conjunto base y onda cuadrada 5,5Hz')

subplot(1,2,2)
bar(SIM_SQ,'b');
xlabel('Frecuencias de las senoidales a comparar (Hz)');
ylabel('Valor de la similitud');
title('Similitud entre conjunto base y onda cuadrada 5,5Hz')


