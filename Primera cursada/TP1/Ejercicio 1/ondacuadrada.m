function [xt, t] = ondacuadrada(A, tini, tfin, fm, fs, fase)

    T = 1/fm;
  t = tini:T:tfin-T;  %tfin-T para que no muestre el último número
  for i=1:length(t)
    if (mod(2*pi*fs*t(i) + fase, 2*pi) >= pi)
      xt(i) = -A;
    else
      xt(i) = A;
    endif
  endfor
