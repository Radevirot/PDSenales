tini = 0; tfin = 1; fm = 100;
fs1 = 10; fs2 = 25; fs3 = 50; #2fs <= fm
fase1 = 0; fase2 = pi/4; fase3 = pi/2;


[t_sen1, x_sen1] = senoidal(tini, tfin, fm, fs1, fase1, 1);
[t_sen2, x_sen2] = senoidal(tini, tfin, fm, fs2, fase2, 1);
[t_sen3, x_sen3] = senoidal(tini, tfin, fm, fs3, fase3, 1);

figure;
subplot(3,1,1);
plot(t_sen1, x_sen1); title('fs = 10, fase = 0')
subplot(3,1,2);
plot(t_sen2, x_sen2); title('fs = 25, fase = pi/4')
subplot(3,1,3);
plot(t_sen3, x_sen3); title('fs = 50, fase = pi/2')


[t_sinc1, x_sinc1] = gensinc(tini, tfin, fm, fs1);
[t_sinc2, x_sinc2] = gensinc(tini, tfin, fm, fs2);
[t_sinc3, x_sinc3] = gensinc(tini, tfin, fm, fs3);

figure;
subplot(3,1,1);
plot(t_sinc1, x_sinc1); title('fs = 10')
subplot(3,1,2);
plot(t_sinc2, x_sinc2); title('fs = 25')
subplot(3,1,3);
plot(t_sinc2, x_sinc2); title('fs = 50')


[t_sq1, x_sq1] = cuadrada(tini, tfin, fm, fs1, fase1);
[t_sq2, x_sq2] = cuadrada(tini, tfin, fm, fs2, fase2);
[t_sq3, x_sq3] = cuadrada(tini, tfin, fm, fs3, fase3);

figure;
subplot(3,1,1);
plot(t_sq1, x_sq1); title('fs = 10, fase = 0')
subplot(3,1,2);
plot(t_sq2, x_sq2); title('fs = 25, fase = pi/4')
subplot(3,1,3);
plot(t_sq3, x_sq3); title('fs = 50, fase = pi/2')


