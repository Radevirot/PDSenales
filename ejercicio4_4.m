clear all; clc;

%vamos a verlo con la ventana de hamming, vamos a generar la ventana y
%hacemos variaciones aumentando la cantidad de ceros antes y después de la
%señal, esto hace que inicialmente la energía de la señal esté más dispersa
%(cuando no agrego ceros), y luego esté más concentrada en un punto.
%vamos a poder apreciar que mientras más ceros agregue antes y después
%(es decir, mientras más concentre la señal en un punto), más dispersas
%estarán las frecuencias.
fm = 20;

[x, t] = generar_ventana(-0.4,0.4,fm,'Rect');

ceros10 = zeros(1,10);
ceros100 = zeros(1,100);

new_x10 = [ceros10 x ceros10];
new_x100 = [ceros100 x ceros100];

X0 = fft(x);
X10 = fft(new_x10);
X100 = fft(new_x100);
[X0, f0] = centrar_frecuencias(X0,fm,length(x));
[X10, f20] = centrar_frecuencias(X10,fm,length(new_x10));
[X100, f100] = centrar_frecuencias(X100,fm,length(new_x100));

figure;
subplot(4,1,1)
stem(t,x); grid on; grid minor
title('Ventana Rectangular')
subplot(4,1,2)
plot(f0,abs(X0)); grid on; grid minor
title('Frecuencia concentrada (sin ceros)')
subplot(4,1,3)
plot(f20,abs(X10)); grid on; grid minor
title('Frecuencia menos concentrada (10 ceros)')
subplot(4,1,4)
plot(f100,abs(X100)); grid on; grid minor
title('Frecuencia dispersa (100 ceros)')


