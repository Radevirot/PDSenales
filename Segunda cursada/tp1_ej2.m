[t, x] = senoidal(0, 2*pi, 200, 1, 0, 1);
subplot(4,1,1)
stem(t,x); title('normal')

tinv = -1*t;
subplot(4,1,2)
stem(tinv,x); title('inversión')

xabs = abs(x);
subplot(4,1,3)
stem(t,xabs); title('rectificación')

xcuant = cuantizacion(x,8);
subplot(4,1,4)
stem(t,xcuant); title('cuantización')

