clear all; clc;

%genero la señal
[x, t] = senoidal(1, 0, 1, 100, 5, 0);
%justo el ejercicio pide una senoidal de 10 de frec y al mismo tiempo un
%desplazamiento temporal de 10 muestras, eso hace que al final no se
%pueda distinguir visualmente el desplazamiento, así que en este caso
%modifiqué la frecuencia de la senoidal a la mitad (5Hz) para poder
%apreciar el desplazamiento.
%también se puede modificar el retardo para verlo.

%transformo la señal al dominio de las frecuencias
X = fft(x);

%genero un vector con los valores que voy a usar para multiplicar los
%elementos de X y producir un desplazamiento temporal en el dominio de
%las frecuencias
N=length(x); k = 0:N-1; p = 10; % (retardo) x[n-p]
exp_complejas = exp(-1j * 2 * pi * k * p /N);
X_desp = X.*exp_complejas;

%calculo transformada inversa
x_desp = ifft(X_desp);

figure;
subplot(2,1,1)
stem(t,x,'b')
title('Original')
subplot(2,1,2)
stem(t,real(x_desp),'r')
title('Desplazada')



















