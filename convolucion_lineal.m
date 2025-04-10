function y = convolucion_lineal(x,h)

  N = length(x)+length(h)-1;

  for k=1:N

    suma=0;

    for i=1:N

      h_resta = 0;
      valor_x = 0;

      if (k-i+1 > 0 && k-i+1 <= length(x))
        h_resta = h(k-i+1);
      endif

      if (i <= length(x))
        valor_x = x(i);
      endif

      suma += valor_x*h_resta;

    endfor

    y(k)=suma;

  endfor

% inicialmente tomábamos k-i en el if de h, pero esto hacía que el primer valor
% siempre fuera 0 (k=1, i=1), por lo que el if acababa asignado cero
% ahora, con el k-i+1 comienza siempre desde el 1.



endfunction
