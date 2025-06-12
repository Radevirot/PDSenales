%este es larguito
clear all; clc;

%arranquemos armando la suma de senoidales que nos pide:
T = 0.001; fm = 1/T; %fm = 1000
tini = 0; tfin = 1;
fs1 = 10; fs2 = 20;
A1 = 1; A2 = 4;
fase = 0;

[s1, t] = senoidal(A1, tini, tfin, fm, fs1, fase);
[s2, t] = senoidal(A2, tini, tfin, fm, fs2, fase);
sn = s1+s2;

%graficamos la suma
figure;
stem(t,sn);
title('Suma de senoidales')
ylabel('Valor de la señal')
xlabel('Tiempo (s)')

%calculamos la transformada discreta de fourier usando fft
Sk = fft(sn);

% ahora, la fft nos devuelve la primera mitad correspondiente a freqs positivas
% y la segunda mitad correspondiente a freqs negativas, vamos a generar un
% eje de frecuencias y a reordenar los espectros acordemente

N = length(t);
[Sk_c, f_c] = centrar_frecuencias(Sk,fm,N);

%voy a graficar la parte real, la parte imaginaria y la magnitud de Sk_c por
%separado.

figure;
subplot(3,1,1);
stem(f_c,real(Sk_c),'b');
title('Parte real')
xlabel('Frecuencias (Hz)')
subplot(3,1,2);
stem(f_c,imag(Sk_c),'r');
title('Parte imaginaria')
xlabel('Frecuencias (Hz)')
subplot(3,1,3);
stem(f_c,abs(Sk_c),'g');
title('Magnitud')
xlabel('Frecuencias (Hz)')


% verificamos Parseval
energia_sn = norm(sn)^2;
energia_Sk = (1/N)*norm(Sk)^2;
% para eso checkeamos si la resta da un número muy pequeño, por posibles
% errores numéricos
if (energia_Sk-energia_sn <= 1e-10)
  disp("Se verifica la relación de Parseval");
else
  disp("NO se verifica la relación de Parseval");
endif


% ----------------- segunda parte ------------------

sn1 = sn+4;

fs1 = 10; fs2 = 11;
[s1, t] = senoidal(A1, tini, tfin, fm, fs1, fase);
[s2, t] = senoidal(A2, tini, tfin, fm, fs2, fase);

sn2 = s1+s2;

fs1 = 10 ; fs2 = 10.5;
[s1, t] = senoidal(A1, tini, tfin, fm, fs1, fase);
[s2, t] = senoidal(A2, tini, tfin, fm, fs2, fase);
sn3 = s1+s2;

fs1 = 10; fs2 = 20;
tfin=2;
[s1, t2] = senoidal(A1, tini, tfin, fm, fs1, fase);
[s2, t2] = senoidal(A2, tini, tfin, fm, fs2, fase);
sn4 = s1+s2;

Sk1 = fft(sn1);
[Sk_c1, f_c1] = centrar_frecuencias(Sk1,fm,N);
Sk2 = fft(sn2);
[Sk_c2, f_c2] = centrar_frecuencias(Sk2,fm,N);
Sk3 = fft(sn3);
[Sk_c3, f_c3] = centrar_frecuencias(Sk3,fm,N);
Sk4 = fft(sn4);
[Sk_c4, f_c4] = centrar_frecuencias(Sk4,fm,length(t2));

figure;
subplot(2,2,1)
stem(f_c1,abs(Sk_c1)/N);
title('sin(2 pi 10 t) + 4sin(2 pi 20 t)+ 4');
xlabel('Frecuencias (Hz)')
ylabel('Magnitud')
subplot(2,2,2)
stem(f_c2,abs(Sk_c2)/N);
title('sin(2 pi 10 t) + 4sin(2 pi 11 t)');
xlabel('Frecuencias (Hz)')
ylabel('Magnitud')
subplot(2,2,3)
stem(f_c3,abs(Sk_c3)/N);
title('sin(2 pi 10 t) + 4sin(2 pi 10.5 t)');
xlabel('Frecuencias (Hz)')
ylabel('Magnitud')
%acá aparece un efecto conocido como "fuga espectral" o spectral leakage, ya que
%la frecuencia de muestreo está "entre medio" de dos frecuencias del eje de la
%transformada, este efecto
subplot(2,2,4)
stem(f_c4,abs(Sk_c4)/length(t2));
title('t=[0...2) · sin(2 pi 10 t) + 4sin(2 pi 20 t)');
xlabel('Frecuencias (Hz)')
ylabel('Magnitud')






















