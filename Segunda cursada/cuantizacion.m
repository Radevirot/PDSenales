function x_out = cuantizacion(x, N)

  xcuant = x-min(x); #resto el mínimo para hacer positiva la función
                     #pq sino la cuantización no la incluye
  rango = abs(min(x))+abs(max(x)); #obtengo el rango completo de la función
                                   #para calcular la magnitud del paso H
  H = rango/(N-1);

  for i=1:length(x)

    if (xcuant(i) < 0)
     x_out(i) = 0;
    elseif (xcuant(i) >= ((N-1)*H))
     x_out(i) = (N-1)*H;
    elseif (0 <= xcuant(i) && xcuant(i) < (N-1)*H)
     x_out(i) = H*floor(xcuant(i)/H);
    endif

  endfor

  x_out = x_out+min(x);
