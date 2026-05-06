# primero buscamos la forma de cargar los elementos del archivo en un vector

fid = fopen('te.txt', 'r'); % Open the file in read mode
data = textscan(fid, '%f'); % Read integers, floats, and strings
fclose(fid); % Close the file
signal = data{1};
signal = signal';

# nos guardamos la cantidad de muestras y generamos un vector que vaya de 1
# hasta ese número para poder graficarlo posteriormente

samplecount = length(signal);
samples = [1:samplecount];

# estimamos una frecuencia de muestreo a la que se grabó la señal original y
# establecemos cuánto van a durar nuestras ventanas de las que vamos a agarrar
# los números sonando
# (esto porque hay ruido - numero - ruido - numero y así sucesivamente)

fm=11025;
duracion_pico = 0.25; #segs
duracion_pico_m = duracion_pico*11025; #muestras

#player = audioplayer(signal,fm); play(player) #para escuchar el audio

stem(samples,signal); hold on;

#graficamos la señal y agarramos los comienzos de los picos
picos = [17000 30500 39500 48500 59500 69800 80800]; #vemos que son 7 dígitos

# vamos a hacernos un vector de ventanas, que sería una matriz de 7xduracion_pico_m
# esto nos va a servir para agilizar un poco más adelante
ventanas=[];
for d=1:7
  ventanas(d,:)=[signal(picos(d):picos(d)+duracion_pico_m-1)];
end


for i = 1:length(picos)

  plot([picos(i), picos(i)], [-1.5, 1.5], 'r-', 'linewidth', 1);
  plot([picos(i)+duracion_pico_m, picos(i)+duracion_pico_m], [-1.5, 1.5], 'r-', 'linewidth', 1);

endfor

# nos hacemos una matriz que corresponda a la tabla de los digitos del
# teléfono, que luego utilizaremos indexada para obtener los números

matriz_tabla = [1 2 3 ; 4 5 6 ; 7 8 9; 10 0 11];

# necesitamos definir las 7 señales senoidales con sus respectivas
# frecuencias, vamos a meterlas en vectores separados (formando matrices)

[~, xR_697]= senoidal(0, duracion_pico, fm, 697, 0, 1);
[~, xR_770]= senoidal(0, duracion_pico, fm, 770, 0, 1);
[~, xR_852]= senoidal(0, duracion_pico, fm, 852, 0, 1);
[~, xR_941]= senoidal(0, duracion_pico, fm, 941, 0, 1);
senoidales_filas = [xR_697 ; xR_770 ; xR_852 ; xR_941];
[~, xC_1209]= senoidal(0, duracion_pico, fm, 1209, 0, 1);
[~, xC_1336]= senoidal(0, duracion_pico, fm, 1336, 0, 1);
[~, xC_1477]= senoidal(0, duracion_pico, fm, 1477, 0, 1);
senoidales_columnas = [xC_1209 ; xC_1336 ; xC_1477];

# ~ es para no guardar el valor

# ahora lo que deberíamos hacer es revisar los productos punto entre las
# senoidales que generamos y las ventanas obtenidas en base a los picos y
# las duraciones, revisando cuál es el máximo para las filas y cuál para las
# columnas.

# primero revisamos el caso pasa las filas, luego para las columnas, nos
# guardamos los resultados en dos vectores y obtenemos la posición de los
# máximos de ambos, estos acabarían siendo los índices para nuestra matriz_tabla

# pero ojo, recordemos que esto lo tenemos que hacer por cada dígito! entonces
# está todo dentro de un for de 1 a 7.

result = [];

for d=1:7
  dots_rows=[];
  dots_cols=[];

  for i=1:4
    dots_rows(i)= abs(dot(senoidales_filas(i,:),ventanas(d,:)));
  endfor
  for i=1:3
    dots_cols(i)= abs(dot(senoidales_columnas(i,:),ventanas(d,:)));
  endfor
  [~, i] = max(dots_rows);
  [~, j] = max(dots_cols);

  result(d) = matriz_tabla(i,j);

endfor

result



