# y[n] = 0.6y[n-1] + x[n] + 0.2x[n-1]

# Parte II

# Parámetros
N = 20;
y = zeros(1,N);

# Función Delta
delta = zeros(1,N);
delta(1) = 1;

# Coeficientes del sistema
b= [1,0.2];
a= [1,0.6];

h= respuesta_impulso_lti(b,a, N)


stem(0:N-1, h); hold on; title('Respuesta al impulso')

# Parte III

# Parámetros
L = 10;

# Entrada
x1= 0:L-1;

M = L + N-1; # Longitud de salida.

# Método 1 - Convolución Lineal
y1 = conv(x1,h)
figure;
subplot(3,1,1)
plot(0:M-1,y1); hold on; stem(0:M-1, y1); title('Método 1 - Convolución Lineal')

# Método 2 - Representación Matricial

h2= toeplitz([h, zeros(1,L-1)], [h(1), zeros(1,L-1)]);
y2= h2 * x1';
y2= y2'
subplot(3,1,2)
plot(0:M-1,y2); hold on; stem(0:M-1, y2); title('Método 2 - Representación Matricial')

# Método 3 - Convolución Circular
x2= [x1, zeros(1,N-1)];
h2= [h, zeros(1,N-1)];

y3 = convolucion_circular(x2, h2)
subplot(3,1,3)
plot(0:M-1,y3); hold on; stem(0:M-1, y3); title('Método 3 - Convolución Circular')
