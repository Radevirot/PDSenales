[xt, t] = senoidal(1, 0, 1, 10, 1, 0);

[xm, tm] = interpolador_sinc(t, xt, 10, 40);
% !!! Preguntar cómo usar mi propia función sinc para el interpolador

subplot(2,1,1);
stem(t,xt)
subplot(2,1,2);
stem(tm,xm);




