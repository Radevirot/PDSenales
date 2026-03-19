#Ejercicio 1 - FILTROS
clc;
clear all;
cla;
clf;
pkg load signal;
#La idea es diseñar un filtro FIR mediante ventaneo y truncado, y eliminar el ruido de linea de una señal muestreada a 300hz
#Es decir, un filtro FIR RECHAZA BANDA a 50 hz (algo muy estrecho, Q muy finito)
fm=300; #dato del problema
#Siguiendo los lineamientos de la teoria :

#-------------------Especificar los req en fase y modulon del filtro-------------------#
#Fase : Retardo temporal (esto se vio en fourier que es multiplicar por e^(-j*t0*w)
#Modulo : 0 en 50 hz, que afecte lo menos posible a las demas
fr=50;
#-------------------Muestrear la respuesta en frecuencia del filtro-------------------#
#Partimos de una H[k] ya discreta. Esto acarrea el error de usar la TDF con un sistema FIR.
#La TDF supone que mis señales son periodicas, y me da una "Sinc" periodica.
#Por eso tengo que usar una respuesta al impulso Periodica (algo asi como una onda cuadrada pero con centro en 0)
#Pero eso me acarrea que al usar la TDF inversa, me va a quedar una Sinc periodica, que NO coincide con la señal que tiene que dar.
#Sumado a eso, voy a tener los problemas de ALIASING si tomo pocas muestras en la respuesta al impulso.

#Aca tengo que tener en cuenta que, como mi h[n] decae rapidamente (por ser un sistema FIR), si tomo un M (cantidad de muestras) mucho mayor,
#las perturbaciones por la periodizacion de la TDF me quedan mas (lejos) entre si, lo cual reduce los problemas antes explicados
#Mucho mayor M que la cantidad de muestras N de mi filtro a utilizar
#Regla practica : M =  10*N

#Datos del muestreo
N = 11;
M = 10*N;


##MODULO
M_fourier=2*M+1;
#y lo ultimo, el delta f para saber de que tamaño va a ser las "zonas" entre mis muestras
#Esto despues lo uso para ver en donde cae el ruido a eliminar
df=fm/M_fourier;

muestras=ones(1,M+1);#Arranco con todas las muestras en 1 (todas las frecuencias en 1
nr=fix(fr/df)+1; #diviendo fr por la cant de muestras, obtengo en que meustra esta fr
#se le suma 1 por los indices

nm=ceil(1/df); #Calculo la cant de muestras que va a tener la banda alrededor de 50hz

muestras(nr-nm:nr+nm) = 0;#Convierto en 0 la banda alrededor de 50 hz
stem(0:M,muestras);
title('Modulo de la respuesta al impulso');
##AGREGAR LA FASE
#La idea es usar un retardo
#Para que me quede un sistema CAUSAL, es decir, no tengo que tener muestras negativas, es decir, me queda toda la señal dentro de la ventana SIN parte negativas
#Cuanto retardo meta ? depende de mi cantidad de muestras. La idea es hacer toda la señal positiva, es decir, N-1/2
retardo=(N-1)/2;
fase=exp(-j*2*pi*retardo*([0:M]/M_fourier));

#Muestras retardadas
R=muestras.*fase;

#Solo me falta agregar las freuencias negativas
R=[R conj(R(end:-1:2))];

#-------------------Aplicar la TDF inversa para obtener h[n]-------------------#
#RESPUESTA AL IMPULSO QUE BUSCABA
h=real(ifft(R));#real para eliminar parte imaginaria por precision numerica
figure;
plot(h)
title('Respuesta al impulso en f');
grid on;

#-------------------Ventaneo y truncado------------------#
#Aca la idea es probar varias ventanas truncadas hasta N.Recorda que se trunca porque la sinc va de -inf a +inf, y no podes procesar eso.
figure;
#VENTANA CUADRADA :
hf_cuad=zeros(1,N);
for i=1:N
  hf_cuad(i)=h(i)*1;
endfor
subplot(2,2,1)
stem(hf_cuad)
title('Cuadrada');

#VENTANA Hamming :
hf_hamming=zeros(1,N);
for i=1:N
  hf_hamming(i)=h(i)*((27/50)-(23/50)*cos(2*pi*i*N));
endfor
subplot(2,2,2)
stem(hf_hamming)
title('Hamming');

#VENTANA Bartlett :
hf_bartlett=zeros(1,N);
for i=1:fix(N/2)
  hf_bartlett(i)=h(i)*(2*i)/(N);
endfor
for i=fix(N/2):N
  hf_bartlett(i)=(h(i))*(2-(2*i)/(N));
endfor
subplot(2,2,3)
stem(hf_bartlett)
title('Bartlett');

#VENTANA Blackman :
hf_blackman=zeros(1,N);
for i=1:N
  hf_blackman(i)=h(i)*(21/50-(1/2* cos((2*pi*i)/(N)))+(2/25* cos((4*pi*i)/(N))));
endfor
subplot(2,2,4)
stem(hf_blackman)
title('Blackman');


##RESPUESTAS EN FRECUENCIAS :
figure;
freqz(hf_cuad,1,1000,fm)
title('Respuesta en frecuencia CUADRADA');

figure;
freqz(hf_hamming,1,1000,fm)
title('Respuesta en frecuencia Hamming');

figure;
freqz(hf_bartlett,1,1000,fm)
title('Respuesta en frecuencia Bartlett');

figure;
freqz(hf_blackman,1,1000,fm)
title('Respuesta en frecuencia Blackman');
