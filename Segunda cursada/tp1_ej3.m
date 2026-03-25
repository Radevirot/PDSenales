# amplitud = 3
# t1 = 0,00625s
# fase = -pi/4 rad
# frecuencia senoidal = 20Hz
# frecuencia de muestreo = 800Hz
# período muestreo (Tm) = 0,00125s
#
#
# la amplitud se obtiene mirando los valores mínimos y máximos de la senoidal

# la frecuencia de la senoidal se puede obtener haciendo una relación, podemos
# observar que en 0,1 segundos hay 2 ciclos, esto quiere decir que hay 20 ciclos
# en 1 segundo, por lo que esa es la fs.

# para el período de muestreo podemos ver que en 0,01 segundos tenemos 8
# muestras, lo que significa que hay una muestra cada 0,00125s y la freq de
# muestreo es de 800Hz.

# la fase la obtenemos con phi = -2*pi*fs*t1 donde t1 = Tm * 5
# por lo que phi = -0,7854 rad = -pi/4 rad = -45º
