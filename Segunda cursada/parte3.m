# Parte III

# Parámetros
N = 20;
L = 10;

# Función Delta
delta = zeros(1,N);
delta(1) = 1;

# Coeficientes del sistema.
b= [1,0.2];
a= [1,0.6];

# Respuesta al impulso.
h= filter(b,a, delta)

# Entrada
x1= 0:L-1;

# Método 1 - Convolución Lineal
y1 = conv(x1,h);

# Método 2 - Representación Matricial
M = L + N-1; # Longitud de salida.
h2= toeplitz([h, zeros(1,L-1)], [h(1), zeros(1,L-1)]);
y2= h2 * x1';
y2= y2';

# Método 3 - Convolución Circular
x2= [x, zeros(1,N-1)];
h2= [h, zeros(1,N-1)];

y3 = conv_circular(x2, h2, M);
