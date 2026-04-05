function x = mi_sinc(t)

  fs = 0.5;

  for i=1:length(t);
    if (t(i)==0)
      x(i) = 1;
    else
      x(i) = (sin(2*pi*fs*t(i)))/(2*pi*fs*t(i));
    endif
  endfor

