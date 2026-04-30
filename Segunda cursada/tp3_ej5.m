fid = fopen('te.txt', 'r'); % Open the file in read mode
data = textscan(fid, '%f'); % Read integers, floats, and strings
fclose(fid); % Close the file

signal = data{1};
samplecount = length(signal);
samples = [1:samplecount];

fm=11025;
duracion_pico = 0.2; #segs
duracion_pico_m = 0.2*11025; #muestras

#player = audioplayer(signal,fm); play(player) #para escuchar el audio

stem(samples,signal); hold on;

#graficamos la señal y agarramos los comienzos de los picos
picos = [17000 30000 39500 48500 59500 69800 80800];


for i = 1:length(picos)

  plot([picos(i), picos(i)], [-1.5, 1.5], 'r-', 'linewidth', 1);
  plot([picos(i)+duracion_pico_m, picos(i)+duracion_pico_m], [-1.5, 1.5], 'r-', 'linewidth', 1);

endfor

matriz_tabla = [1 2 3 ; 4 5 6 ; 7 8 9; 10 0 11];

    | 1209 | 1336 | 1477 |
697
770
852
941

[t, xR_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);
[t, xR_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);
[t, xR_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);
[t, x_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);
[t, xR_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);
[t, xR_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);
[t, xR_697]= senoidal(0, duracion_pico_m, fm, 697, 0, 1);



