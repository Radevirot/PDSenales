
[t, x_S] = senoidal(0, 2, 10, 1, 0, 1);
x_R = randn(1,length(x_S))./10;

x_SR = x_R+x_S;

plot(t,x_SR)

potencia_senal = (1/length(x_S))*sum(x_S.^2)
potencia_ruido = (1/length(x_R))*sum(x_R.^2)
SNR = 10*log10(potencia_senal/potencia_ruido)

disp('multiplico por')
const = 2

new_x_R = const*x_R;

potencia_ruido = (1/length(new_x_R))*sum(new_x_R.^2)
SNR = 10*log10(potencia_senal/potencia_ruido)

disp('encuentro const para que snr = 0')
const = sqrt(potencia_senal/potencia_ruido)

new_x_R = const*new_x_R;

potencia_ruido = (1/length(new_x_R))*sum(new_x_R.^2)
SNR = 10*log10(potencia_senal/potencia_ruido)

