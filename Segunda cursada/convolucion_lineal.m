function [y] = convolucion_lineal(x,h)

  l_x = length(x);
  l_h = length(h);
  l_y = l_h+l_x-1;
  y = [];

  for n=1:l_y  # largo de n+m-1
    suma=0;
    for k=1:l_x  # recorro toda la señal

      if ((n-k+1) > 0) && ((n-k+1) <= l_h) #n-k+1 para que y(0) no sea 0
                                           #(desplazo el índice por octave)
      suma += x(k)* h(n-k+1);
      endif

    endfor

    y(n) = suma;

  endfor


endfunction



