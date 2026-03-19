% el gráfico observado en el ejercicio tiene "muestras" en el eje X, esto es
% porque la gráfica es un stem(abs(fft(x))), donde no se centraron las
% frecuencias, así que para poder determinar la frecuencia de la senoidal a
% partir del gráfico debemos centrar manualmente las frecuencias.
%
% la señal fue muestreada con fm=50 y durante un segundo, por lo que debería
% haber un total de 50 muestras (N) en la misma, esto significa que en el eje de
% las frecuencias deberíamos ir desde -25 hasta 24 ((-N/2 : N/2-1)*fm/N).
%
% ahora, sabiendo que las frecuencias positivas son la primera mitad y las
% negativas la segunda, la muestra 26 corresponde a la frecuencia -25, la
% 27 a la -24 y la 28 a la -23, y podemos realizar el mismo razonamiento
% pero al revés para la positiva, ya que la muestra 25 corresponde a la
% frecuencia 24, la muestra 24 corresponde a la frecuencia 23, por lo que
% la gráfica muestra que la senoidal tiene una frecuencia de 23Hz, que
% no se corresponde con los 27Hz utilizados.
%
% esto tiene que ver con la incapacidad de reconstruir la senoidal si la
% frecuencia de muestreo es menor al doble de la frecuencia de la señal, es
% también llamado el fenómeno de "aliasing"

fm = 50; fs = 105;

[xt, t] = senoidal(3, 0, 2, fm, fs, 0);

X = fft(xt);
[X, f] = centrar_frecuencias(X,50,length(t));
stem(f,abs(X));

k=round(fs/fm);
frecuencia_aliasing = abs(fs-((k*fm)))

% la relación entre la magnitud del espectro y la amplitud de la señal
% es |X| = A*(N/2)







