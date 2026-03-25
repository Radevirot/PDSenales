tini = 0; tfin = 1; fs = 5; fase = 0; A = 1;
fm1 = 100; fm2 = 25; fm3 = 10; fm4 = 4; fm5 = 1; fm6 = 0.5;

[t1, x1] = senoidal(tini, tfin, fm1, fs, fase, A);
[t2, x2] = senoidal(tini, tfin, fm2, fs, fase, A);
[t3, x3] = senoidal(tini, tfin, fm3, fs, fase, A);
[t4, x4] = senoidal(tini, tfin, fm4, fs, fase, A);
[t5, x5] = senoidal(tini, tfin, fm5, fs, fase, A);
[t6, x6] = senoidal(tini, tfin, fm6, fs, fase, A);


subplot(3,2,1);
plot(t1,x1); hold on; stem(t1,x1); title('100Hz')
subplot(3,2,2);
plot(t2,x2); hold on; stem(t2,x2); title('25Hz')
subplot(3,2,3);
plot(t3,x3); hold on; stem(t3,x3); title('10Hz')
subplot(3,2,4);
plot(t4,x4); hold on; stem(t4,x4); title('4Hz')
subplot(3,2,5);
plot(t5,x5); hold on; stem(t5,x5); title('1Hz')
subplot(3,2,6);
plot(t6,x6); hold on; stem(t6,x6); title('0.5Hz')



