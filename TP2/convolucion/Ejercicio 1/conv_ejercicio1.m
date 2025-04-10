clear all; clc;
size_x = 5;
size_h = 5;
size_y = size_x+size_h-1;
t = 1:size_y;

x = rand(1,size_x)
%h = zeros(1,size_h); h(1)=1;
h = rand(1,size_h)

subplot(5,1,1)
plot(t(1:size_x),x)
axis([0 10])
title('Señal')

subplot(5,1,2)
plot(t(1:size_h),h)
axis([0 10])
title('Respuesta al impulso')

y_convlineal = convolucion_lineal(x,h)

subplot(5,1,3)
plot(t,y_convlineal)
axis([0 10])
title('Mi convolucion')

y_conv = conv(x,h)

subplot(5,1,4)
plot(t,y_conv)
axis([0 10])
title('Convolucion Octave')


% FILTRO %

y_filtro = filter(h,1,x)

subplot(5,1,5)
plot(t(1:5),y_filtro)
axis([0 10])
title('Filtro')

% El filtro genera la ecuación en diferencias descripta en el tp, por lo que
% la salida está limitada a los primeros n valores, así que logra imitar
% la convolución hasta n.



