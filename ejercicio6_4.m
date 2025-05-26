clear all; clc;

x = load('necg.txt');
x = x'; %lo traspongo porque me rompe la funcion de centrar_frecuencias

fm = 360;
T = 1/fm;
tfin = length(x)/fm;
t = 0:T:tfin-T;

fini = 40; ffin = 180;

figure;
subplot(2,1,1)
plot(t,x,'r')
title('ECG con ruido - Señal')
xlabel('Tiempo')

X = fft(x);
[X_desp, f] = centrar_frecuencias(X,fm,length(t));

subplot(2,1,2)
plot(f,abs(X_desp),'b')
title('ECG con ruido - Espectro de frecuencias')
xlabel('Frecuencias')

for i=1:length(f)

  if f(i) >= -ffin && f(i) <= -fini || f(i) >= fini && f(i) <= ffin
    X_desp(i)=0;
  endif

endfor

x_nuevo = ifft(ifftshift(X_desp));

figure;
subplot(2,1,1)
plot(t,x_nuevo,'r')
title('ECG filtrado - Señal')
xlabel('Tiempo')
subplot(2,1,2)
plot(f,abs(X_desp),'b')
title('ECG filtrado - Espectro de frecuencias')
xlabel('Frecuencias')

























