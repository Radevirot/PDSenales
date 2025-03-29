
[xt, t] = senoidal(1, 0, 2*pi, 200, 1, 0);
figure(1);
stem(t,xt);
title('Comun');
hold on;

tinv = -1*t;
figure(2)
stem(tinv,xt);
title('Inversion');

xtabs = abs(xt);
figure(3);
stem(t,xtabs);
title('Rectificacion de onda completa')

xtforcuant = xt-min(xt) %le sumo el absoluto del mínimo pq sino se lo resta
                    %(esto para levantar la función por arriba del 0 y que la cuantización no la desaparezca)
N = 8;
rangofuncion = abs(min(xt))+abs(max(xt));
H = rangofuncion/(N-1); % El H alto de cada intervalo en y para tener N niveles.
                        % Dividimos por N-1 para tener N niveles.
cuantizedxt = cuantizacion(xtforcuant,H,N);
cuantizedxt = cuantizedxt+min(xt);
figure(4);
stem(t,cuantizedxt);
title('Cuantizacion de 8 niveles')
