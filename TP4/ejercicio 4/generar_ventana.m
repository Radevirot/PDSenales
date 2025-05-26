% devuelve la ventana en el dominio del tiempo y en el dominio de la
% frecuencia (centrada)
function [x, t, X, f] = generar_ventana(tini,tfin,fm,ventana)

  T = 1/fm;
  t = tini:T:tfin-T;
  N = length(t);
  n = 0:N-1;

  switch (ventana)
    case 'Rect'
      x = ones(1,N);
    case 'Hanning'
      x = (1/2) - (1/2) * cos(2*pi*n/(N-1));
    case 'Hamming'
      x = 27/50 - (23/50)*cos(2*pi*n/(N-1));
    case 'Blackman'
      x = 21/50 - (1/2)*cos(2*pi*n/(N-1)) + (2/25)*cos(4*pi*n/(N-1));
  otherwise
    error('Nombre de ventana incorrecto')
  endswitch

  X = fft(x);
  [X, f] = centrar_frecuencias(X,fm,N);


endfunction
