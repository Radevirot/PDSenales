clear all; clc;
N = 40;
a = 0.4;
k = 1:N;

%armo el delta de dirac tamaño N
d_dirac = zeros(1,N); d_dirac(1)=1;

%inicializo x
x = zeros(1,N);
%armo la entrada x
for n=1:N
  if (n-1 < 1)
    x(n) = d_dirac(n);
  else
    x(n) = d_dirac(n) - a*d_dirac(n-1);
  endif
endfor

ha = sin(8.*k);
hb = a.^k;

y1 = convolucion_circular(convolucion_circular(x,ha),hb);
y2 = convolucion_circular(convolucion_circular(x,hb),ha);

subplot(3,1,1)
plot(k,x)
title('x')

subplot(3,1,2)
plot(k,y1)
title('conv(x,ha) -> conv(x,hb)')

subplot(3,1,3)
plot(k,y2)
title('conv(x,hb) -> conv(x,ha)')





