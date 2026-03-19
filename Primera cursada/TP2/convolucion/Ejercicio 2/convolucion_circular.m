function y = convolucion_circular(x,h)

  N = length(x);

  for k=1:N
    suma = 0;

    for l=1:N

      suma += h(l)*x( mod(N+k-l, N) + 1);

    endfor

    y(k)=suma;

  endfor




endfunction
