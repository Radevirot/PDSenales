function [xm, tm] = interpolador_sinc(tn, y, vieja_fm, nueva_fm)

  T = 1/vieja_fm; Ti = 1/nueva_fm;

  tm = tn(1):Ti:tn(end)+T-Ti; %creo el nuevo vector de tiempos con los mismos
                            %extremos pero usando la frecuencia nueva

  xm = zeros(length(tm)); %genero el vector de salidas con ceros para poder recorrerlo

  for m=1:length(xm)

    xm(m) = sum(y .* sinc( (tm(m) - tn)/T ));

    % Acá opero con vectores: le resto a cada tiempo del vector nuevo todos los
    % tiempos del vector viejo, eso me deja un vector nuevo al que divido por T,
    % después le aplico la función sinc a cada uno de sus elementos, multiplico
    % elemento a elemento por los valores de la señal original y finalmente los
    % sumo. Da lo mismo que hacer la sumatoria usando un for de n=1:length(tn).

  endfor



