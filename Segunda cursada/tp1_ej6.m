[t, x] = senoidal(0, 2, 10, 1, 0, 1);
[tm_e, xm_e] = interpolar(t, x, 40, 'escalon');
[tm_l, xm_l] = interpolar(t, x, 40, 'lineal');
[tm_s, xm_s] = interpolar(t, x, 40, 'sinc');


subplot(2,2,1)
stem(t,x); title('Original');

subplot(2,2,2)
stem(tm_e,xm_e); title('Interpolación escalon');

subplot(2,2,3)
stem(tm_l,xm_l); title('Interpolación lineal');

subplot(2,2,4)
stem(tm_s,xm_s); title('Interpolación sinc');

