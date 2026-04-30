function [t, x] = cuadrada(tini, tfin, fm, fs, fase, A)

  T = 1/fm;
  t = tini:T:tfin-T;

  for i=1:length(t);
    if (mod(t(i)*2*pi*fs+fase,2*pi) >= pi)
      x(i) = -A;
    else
      x(i) = A;
    endif
  endfor
