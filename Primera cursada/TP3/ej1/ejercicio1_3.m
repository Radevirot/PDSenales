clear all; clc;

[xtSen, t] = senoidal(3, 0, 10, 5, 0.2, 0);
[xtRamp] = rampa(0,10,10,5,1);
[xtSquare] = ondacuadrada(2, 0, 10, 5, 0.2, 0);
xtRand = randn(10*5,1);

figure;
subplot(2,2,1);
stem(t,xtSen); hold on; plot(t,xtSen,'r'); title('Senoidal')

subplot(2,2,2);
stem(t,xtRamp); hold on; plot(t,xtRamp,'g'); title('Rampa')

subplot(2,2,3);
stem(t,xtSquare); hold on; plot(t,xtSquare,'y'); title('Onda Cuadrada')

subplot(2,2,4);
stem(t,xtRand); hold on; plot(t,xtRand,'c'); title('Aleatorio Normalizado')


disp('----- VALOR MEDIO -----');

valormedio = @(x) sum(x)/length(x);

printf("El valor medio de la Senoidal es %d\n", valormedio(xtSen))
printf("El valor medio de la Rampa es %d\n", valormedio(xtRamp))
printf("El valor medio de la Onda Cuadrada es %d\n", valormedio(xtSquare))
printf("El valor medio de la aleatoria es %d\n", valormedio(xtRand))

disp('')
disp('----- MÁXIMO -----')

printf("El máximo de la Senoidal es %d\n", max(xtSen))
printf("El máximo de la Rampa es %d\n", max(xtRamp))
printf("El máximo de la Onda Cuadrada es %d\n", max(xtSquare))
printf("El máximo de la aleatoria es %d\n", max(xtRand))


disp('')
disp('----- MÍNIMO -----')

printf("El mínimo de la Senoidal es %d\n", min(xtSen))
printf("El mínimo de la Rampa es %d\n", min(xtRamp))
printf("El mínimo de la Onda Cuadrada es %d\n", min(xtSquare))
printf("El mínimo de la aleatoria es %d\n", min(xtRand))

disp('')
disp('----- AMPLITUD -----')

printf("La amplitud de la Senoidal es %d\n", max(abs(xtSen)))
printf("La amplitud de la Rampa es %d\n", max(abs(xtRamp)))
printf("La amplitud de la Onda Cuadrada es %d\n", max(abs(xtSquare)))
printf("La amplitud de la aleatoria es %d\n", max(abs(xtRand)))

disp('')
disp('----- ENERGÍA -----');

energia = @(x) norm(x)^2; % norm(x) es la norma 2, definida como la raíz cuadrada
                          % de la suma del cuadrado del valor absoluto de
                          % cada elemento del vector

printf("La energía de la Senoidal es %d\n", energia(xtSen))
printf("La energía de la Rampa es %d\n", energia(xtRamp))
printf("La energía de la Onda Cuadrada es %d\n", energia(xtSquare))
printf("La energía de la aleatoria es %d\n", energia(xtRand))


disp('')
disp('----- ACCIÓN -----') %norma-1

printf("La acción de la Senoidal es %d\n", sum(abs(xtSen)))
printf("La acción de la Rampa es %d\n", sum(abs(xtRamp)))
printf("La acción de la Onda Cuadrada es %d\n", sum(abs(xtSquare)))
printf("La acción de la aleatoria es %d\n", sum(abs(xtRand)))

disp('')
disp('----- POTENCIA MEDIA -----');

potenciamedia = @(x) sum((abs(x)).^2)/length(x);

printf("La potencia media de la Senoidal es %d\n", potenciamedia(xtSen))
printf("La potencia media de la Rampa es %d\n", potenciamedia(xtRamp))
printf("La potencia media de la Onda Cuadrada es %d\n", potenciamedia(xtSquare))
printf("La potencia media de la aleatoria es %d\n", potenciamedia(xtRand))

disp('')
disp('----- RAÍZ DEL VALOR CUADRÁTICO MEDIO -----');

rms = @(x) sqrt(sum((abs(x)).^2)/length(x));

printf("La raíz del valor cuadrático medio de la Senoidal es %d\n", rms(xtSen))
printf("La raíz del valor cuadrático medio de la Rampa es %d\n", rms(xtRamp))
printf("La raíz del valor cuadrático medio de la Onda Cuadrada es %d\n", rms(xtSquare))
printf("La raíz del valor cuadrático medio de la aleatoria es %d\n", rms(xtRand))



