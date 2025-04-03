function y = sist2_ej1tp2(x, n0)

  for n=1:length(x)
    k = n-1-n0:n-1+n0;
    k(k<0)=0; %los negativos son cero
    k(k>=n-1)=n-1; %los que se pasan del tope se quedan en el tope
    k = k+1; %muevo el índice por octave
    y(n) = sum(x(k))

  endfor

  % Revisar, se podría determinar cuántas veces suma y hacerlo de una.


endfunction
