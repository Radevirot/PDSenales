function y = sists_ej4tp2(x,sistema)

  %1. y[n] = x[n] + y[n-2]
  %2. y[n] = x[n] + 0.5*x[n-1]
  %3. y[n] = x[n] + 0.5*y[n-1] - 0.25*y[n-2]

  N = length(x);
  y = zeros(1,N);

  switch (sistema)
    case '1'

      for i=1:N
        if (i-2 < 1)
          y(i) = x(i);
        else
          y(i) = x(i) + y(i-2);
        endif
      endfor

    case '2'

      for i=1:N
        if (i-1 < 1)
          y(i) = x(i);
        else
          y(i) = x(i) + 0.5*x(i-1);
        endif
      endfor

    case '3'

      for i=1:N
        if (i == 1)
          y(i) = x(i);
        elseif (i == 2)
          y(i) = x(i) + 0.5*y(i-1);
        else
          y(i) = x(i) + 0.5*y(i-1) - 0.25*y(i-2);
        endif
      endfor

    otherwise
      error('ERROR: 1, 2 o 3 para el segundo parámetro.')
  endswitch





endfunction
