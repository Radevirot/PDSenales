function y = convolucion_lineal(x,h)

  % calcula la conv lineal entre x y h.

  N = length(x)+length(h)-1; % tamaño de la señal de salida

  for k=1:N

    suma=0; %inicializo acumulador

    for i=1:N

      h_resta = 0; %inicializo valor de h
      valor_x = 0; % inicializo valor de x

      if (k-i+1 > 0 && k-i+1 <= length(h))
        h_resta = h(k-i+1); %h se recorre al revés (desplazado k unidades) por el espejamiento en la convolución
                            %reviso que los índices no se salgan de los válidos
                            %el +1 es por el manejo de índices de octave
      endif

      if (i <= length(x))
        valor_x = x(i); %x se recorre normalmente, reviso que i no se pase del tamaño de x
      endif

      suma += valor_x*h_resta;

    endfor

    y(k)=suma;

  endfor

% inicialmente tomábamos k-i en el if de h, pero esto hacía que el primer valor
% siempre fuera 0 (k=1, i=1), por lo que el if acababa asignado cero
% ahora, con el k-i+1 comienza siempre desde el 1.



endfunction
