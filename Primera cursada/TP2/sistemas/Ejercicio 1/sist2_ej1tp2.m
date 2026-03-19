function y = sist2_ej1tp2(x, n0)

  % asumimos que fuera del dominio de la señal todos los valores son cero

  y = zeros(1,length(x));

  for n=1:length(x)
    k_inicio = max(n-n0,1); % si n-n0 es más chico que el menor índice válido (1),
                            % me quedo con 1, si es más grande me quedo con el índice
                            % correspondiente
    k_fin = min(n+n0,length(x)); % misma lógica pero al revés

    y(n) = sum(x(k_inicio:k_fin));

  endfor


endfunction
