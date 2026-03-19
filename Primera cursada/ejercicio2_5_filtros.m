#Ejercicio 2 - FILTROS
clc;
clear all;
clf;
pkg load signal;
#La idea es hacer un filtro multi banda que deje pasar una x cantidad de frecuencias
#Aca vamos a asumir que la fm es 4*fmax a filtrar
fm=4*6000;

#Datos del muestreo
N = 3000;
M = 10*N;

##MODULO
M_fourier=2*M+1;
df=fm/M_fourier; #ancho de las bandas a sacar
muestras=zeros(1,M+1);

#Y aqui vamos a ir buscando las frecuencias correspondientes a las distintas bandas
#------100-200------
nr_inf=fix(100/df)+1; #Muestra en donde esta 100hz
nr_sup=fix(200/df)+1; #Muestra en donde esta 200hz
muestras(nr_inf:nr_sup)=1;

#------1640-3028------
nr_inf=fix(1640/df)+1; #Muestra en donde esta 1640hz
nr_sup=fix(3028/df)+1; #Muestra en donde esta 3028hz
muestras(nr_inf:nr_sup)=1;


#------5000-6000------
nr_inf=fix(5000/df)+1; #Muestra en donde esta 5000hz
nr_sup=fix(6000/df)+1; #Muestra en donde esta 6000hz
muestras(nr_inf:nr_sup)=linspace(0,1,length(nr_inf:nr_sup));
stem(0:M,muestras);

title('Modulo de la respuesta al impulso');

retardo=(N-1)/2;
fase=exp(-j*2*pi*retardo*([0:M]/M_fourier));

R=muestras.*fase;

R=[R conj(R(end:-1:2))];

h=real(ifft(R));
figure;
plot(h)
title('Respuesta al impulso en f');
grid on;


#VENTANA de blackman :
hf=h(1:N).*blackman(N).';
figure;
stem(hf)
title('Respuesta en frecuencia y fase');
freqz(hf,1,1000,fm);

#VENTANA CUADRADA :
hf=h(1:N).*boxcar(N).';
figure;
stem(hf)
title('Respuesta en frecuencia y fase');
freqz(hf,1,1000,fm);
