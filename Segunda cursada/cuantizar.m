function qx = cuantizar(x, N)

  mx = max(x);
  mn = min(x);

  y = x + min(x);

  H = mx/(N-1); # Cuantos -1 son los pasitos que doy, eso es lo que me interesa para sacar el H
  qx = [];
  for xn = x
    if (xn < 0)
      qx = [qx 0];
    elseif (0<= xn & xn < (N-1)*H) # Entre el 0 y el máximo
      qx = [qx H*floor(xn/H)]; # int(x/H) da el número del cuanto y al multiplicar por H nos vamos derechito al valor del cuanto.
    elseif (xn >= (N-1)*H) # Mayor al máximo
      qx = [qx (N-1)*H];
    endif
  endfor

endfunction
