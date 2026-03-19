#Ejercicio 2
clc;
clear all;
clf;
#Frecuencia de muestreo;
fm=10000;
#Cantidad de puntos, algo asi como la cantidad de frecuencias a evaluar;
n = 512;

#Punto 1;
y = 1;
x = [1 -1/2 1-4];
freqz(y,x,n,fm);
title('Sistema 1');

#Punto 2;
figure;
y = [0 1];
x = [1 -1 -1];
freqz(y,x,n,fm);
title('Sistema 2');

#Punto 3;
figure;
y = [7];
x = [1 -2 6];
freqz(y,x,n,fm);
title('Sistema 3');

#Punto 4;
figure;
y = zeros(7,1);
for i=(0:7)
  y(i+1)=1/(2^i);
endfor
x = 1;
freqz(y,x,n,fm);
title('Sistema 4');
