N = 5
x = randi(10,1,N)
h = randi(10,1,N)

y_convlineal = convolucion_lineal(x,h)
y_conv = conv(x,h)

a = zeros(1,N);
a(1) = 1
# por la estructura de la ecuación en diferencias generada por filter
# y la definición de convolución podemos deducir que los coeficientes
# que acompañan los desplazamientos en la sumatoria corresponden al
# vector b (es decir, utilizamos nuestra señal x como b), y que los
# desplazamientos se realizan sobre la respuesta al impulso (es decir,
# que nuestra h será el vector x)

y_filter = filter(x,a,h)

# ¿por qué no podemos generar toda la conv lineal con filter?
# porque a diferencia de la convolución, el filter se detiene cuando ambas
# señales se solapan (o sea, cuando n=k), ya que aquí no estamos teniendo
# en cuenta que

