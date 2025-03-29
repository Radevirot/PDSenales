function [xt] = mi_sinc_t(t, fs)

  for i=1:length(t)
    if (t(i) == 0)
      xt(i) = 1;
    else
      xt(i) = sin(2*pi*fs*t(i))/(2*pi*fs*t(i));
    endif
  endfor

