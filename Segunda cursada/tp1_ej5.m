[t1, x1] = senoidal(0, 2, 129, 4000, 0, 1);

plot(t1,x1); hold on; stem(t1,x1); title('4000Hz')

#la frecuencia de la senoidal parace ser de 1Hz en vez de 4000Hz, esto ocurre
#por un fenómeno llamado aliasing, la cantidad de muestras no es suficiente
#para poder apreciar la frecuencia real de la senoidal, es necesario que la
#freq de muestreo sea la mitad o más que la frecuencia de la senoidal
