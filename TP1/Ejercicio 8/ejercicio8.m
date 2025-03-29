clear all; clc;

[xtS, t] = senoidal(6, 0, 3, 20, 1, 0);

[xtR] = randn(1,60);

xt_sum = xtS+xtR;

subplot(3,1,1)
plot(t,xtS)
title('Senoidal')

subplot(3,1,2)
plot(t,xtR)
title('Ruido')

subplot(3,1,3)
plot(t,xt_sum)
title('Suma de ambas')


[PS, PS_dB] = potencia_aproximada(xtS);
[PR, PR_dB] = potencia_aproximada(xtR);
SNR = PS/PR;
SNR_dB = 10*log10(PS/PR);

printf('La potencia de la señal (Ps) es %.4f\n', PS)
printf('En decibeles es %.4f\n', PS_dB)
disp('')
printf('La potencia del ruido (Pr) es %.4f\n', PR)
printf('En decibeles es %.4f\n', PR_dB)
disp('')
printf('La relación señal-ruido (SNR) es %.4f\n', SNR)
printf('En decibeles es %.4f\n', SNR_dB)
disp('')

alpha = input('Ingresa el factor de escalado del ruido: ');

new_xtR = alpha*xtR;
[new_PR, new_PR_dB] = potencia_aproximada(new_xtR);

new_SNR = PS/new_PR;
new_SNR_dB = 10*log10(PS/new_PR);

printf('La potencia del ruido nueva es %.4f\n', new_PR)
printf('En decibeles es %.4f\n', new_PR_dB)
disp('')
printf('La relación señal-ruido nueva es %.4f\n', new_SNR)
printf('En decibeles es %.4f\n', new_SNR_dB)
disp('')

SNR_objetivo = input('Ingresa el valor deseado de SNR: ');

alpha = sqrt(PS/( (10^(SNR_objetivo/10)) * PR))

new_xtR = alpha*xtR;
[new_PR, new_PR_dB] = potencia_aproximada(new_xtR);

new_SNR = PS/new_PR;
new_SNR_dB = 10*log10(PS/new_PR);

printf('La potencia del ruido nueva es %.4f\n', new_PR)
printf('En decibeles es %.4f\n', new_PR_dB)
disp('')
printf('La relación señal-ruido nueva es %.4f\n', new_SNR)
printf('En decibeles es %.4f\n', new_SNR_dB)
disp('')









