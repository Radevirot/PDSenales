function y = sist1_ej1tp2(x, A, fs, T)

  n = 0:length(x)-1;

  g = A*sin(2*pi*fs*n*T);

  y = g.*x;

endfunction
