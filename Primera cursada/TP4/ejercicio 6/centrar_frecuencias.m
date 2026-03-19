
function [Sk_centradas, f_centradas] = centrar_frecuencias(Sk,fm,N)

  delta_f = fm/N; %"paso" de las frecuencias
  mitad = ceil(N/2);
  Sk_centradas = [Sk(mitad+1:end) Sk(1:mitad)];

  if mod(N,2) == 0
    f_centradas = (-N/2 : N/2-1)*delta_f;
  else
    f_centradas = (-(N-1)/2:(N-1)/2)*delta_f;
  endif

endfunction



