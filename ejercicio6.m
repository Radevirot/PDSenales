[xt, t] = senoidal(1, -3, 3, 10, 1, 0);

[xm_sinc, tm_sinc] = interpolador_sinc(t, xt, 10, 40, 'sinc');

[xm_lineal, tm_lineal] = interpolador_sinc(t, xt, 10, 40, 'lineal');

[xm_escalon, tm_escalon] = interpolador_sinc(t, xt, 10, 40, 'escalon');

subplot(4,1,1);
stem(t,xt)
title('Original')

subplot(4,1,2);
stem(tm_sinc,xm_sinc);
title('Interpolada Sinc')

subplot(4,1,3);
stem(tm_lineal,xm_lineal);
title('Interpolada Lineal')

subplot(4,1,4);
stem(tm_escalon,xm_escalon);
title('Interpolada Escalon')




