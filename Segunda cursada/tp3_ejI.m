# Parámetros
N = 500;
fm = 1000;
fs = 100;

# Parte I
# Senoidal.
[t, s] = senoidal(0, N/fm, fm, fs, 0, 1);
plot(t,s);

# Ruido.
r = sqrt(0.5)*randn(1,N);

# Señal compuesta.
x = s+r;

# Norma 2, energía, RMS, acción y amplitud.
n2 = norma(x,2);
e = n2^2;
rms = (1/sqrt(N)) * n2;
acc = norma(x,1);
amp = norma(x,'inf');

# Parte II
# Señal referencia
y = s;

p = sum(y.*x);

# cos(θ) = p / norma2(x) * norma2(y);
# θ = arcos( p / norma2(x) * norma2(y));

tita = acos( p/ (norma(x,2) * norma(y,2)) )
# θ= 0.8 radianes = 46°

# Las señales son algo parecidas, aunque no idénticas
# Esto debido al ruido.
# Si el ángulo fuese cercano a cero, serían muy parecidas, y si fuese
# cercano a 90º (pi/2) serían ortogonales.

# Parte III

phi1 = (s/norma(s,2));
fs=200;
[~, s_200] = senoidal(0, N/fm, fm, fs, 0, 1);
phi2 = (s_200/norma(s_200,2));
alfa1 = dot(phi1,x)
alfa2 = dot(phi2,x) #puedo calcular como producto interno porque están normalizadas

#señal aprox
x_aprox = alfa1.*phi1+alfa2.*phi2;
e = x-x_aprox;
ECT = (norma(e,2))^2

# Parte IV

#El producto interno sería un valor pequeño dado que y[n] sin fase tiene una
#gran similitud con x[n], al haber un desfase de 90 grados estamos prácticamente
#ortogonalizando las dos señales, haciendo que el producto interno
#se vaya a un número pequeño.







