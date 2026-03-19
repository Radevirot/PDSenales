
[xt1, t1] = senoidal(1, 0, 2, 129, 4000, 0);

stem(t1,xt1)
hold on

% En lo que se ve, parece hacer un ciclo en un segundo, por lo que fs = 1 Hz.
% Al ampliar la fm a 16000 o más podemos apreciar que efectivamente es una
% senoidal de fs = 4000 Hz. Debido a la conclusión que yo mismo saqué de
% el ejercicio anterior, la frecuencia de muestreo no es suficiente para poder
% representar todos los ciclos de la senoidal. El efecto se llama "aliasing".


