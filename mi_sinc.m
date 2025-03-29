function [xt, t] = mi_sinc(fm, fs)

  T = 1/fm;
  t = -1:T:1-T;  %tfin-T para que no muestre el último número
  for i=1:length(t)
    if (t(i) == 0)
      xt(i) = 1;
    else
      xt(i) = sin(2*pi*fs*t(i))/(2*pi*fs*t(i));
    endif
  endfor

