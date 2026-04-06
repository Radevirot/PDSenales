% ---- PARTE I ----
[t, x] = senoidal(0, 2, 400, 10, pi/4, 5);
% morfológica: señal digital (tiempo y amplitud discretos)
% fenomenológica: señal determinística -> periódica -> sinusoidal

N = 4;

x_rectificada = abs(x);
x_cuantizada = cuantizacion(x_rectificada,N);

figure;
subplot(2,1,1)
plot(t,x); hold on; stem(t,x); title('Original');

subplot(2,1,2)
plot(t,x_cuantizada); hold on; stem(t,x_cuantizada); title('Rectificada y cuantizada');

% ---- PARTE II ----

var1 = 2; var2 = 0.2;

ruido1 = sqrt(var1) * randn(1,length(x_cuantizada));
ruido2 = sqrt(var2) * randn(1,length(x_cuantizada));

xR1 = x_cuantizada + ruido1;
xR2 = x_cuantizada + ruido2;

potencia_xcuantizada = (1/length(x_cuantizada))*sum(x_cuantizada.^2)
potencia_xR1 = (1/length(xR1))*sum(xR1.^2)
potencia_xR2 = (1/length(xR2))*sum(xR2.^2)

SNR1 = 10*log10(potencia_xcuantizada/potencia_xR1)
SNR2 = 10*log10(potencia_xcuantizada/potencia_xR2)

SNR_deseada = 6

alfa1 = sqrt(potencia_xcuantizada/(10^(SNR_deseada/10)*potencia_xR1))
alfa2 = sqrt(potencia_xcuantizada/(10^(SNR_deseada/10)*potencia_xR2))

new_xR1 = xR1*alfa1;
new_xR2 = xR2*alfa2;

potencia_new_xR1 = (1/length(new_xR1))*sum(new_xR1.^2)
potencia_new_xR2 = (1/length(new_xR2))*sum(new_xR2.^2)

new_SNR1 = 10*log10(potencia_xcuantizada/potencia_new_xR1)
new_SNR2 = 10*log10(potencia_xcuantizada/potencia_new_xR2)
