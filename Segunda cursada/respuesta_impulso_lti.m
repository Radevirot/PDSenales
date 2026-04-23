function [puntitos] = respuesta_impulso_lti(xs, ys, N)
  # xs e ys son arrays
  # de la forma, xs = [1 0 2], ys = [0 1 0] daria
  # y(n) = 1x(n) + 0x(n-1) + 2x(n-2) + 0y(n) + 1y(n-1) + ...

  puntitos = [];
  l = length(xs);
  delta_dirac = zeros(1, N);
  delta_dirac(1) = 1;
  for i = 1:(N)
    suma_total = 0;

    # Procedimiento para xs
    for j = 1:l
      suma_parcial = 0;
      if i - j + 1 <=0
        suma_parcial = 0;
      else
        suma_parcial = xs(j)*delta_dirac(i - j + 1);
      endif
      suma_total = suma_total + suma_parcial;
    endfor

    # Procedimiento para ys
    for j = 2:l
      suma_parcial = 0;
      if length(puntitos) - j + 2 <=0
        suma_parcial = 0;
      else
        suma_parcial = ys(j)*puntitos(end -j +2)
      endif
      suma_total = suma_total + suma_parcial;
    endfor
    puntitos = [puntitos suma_total];
  endfor


endfunction
