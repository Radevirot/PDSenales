function [xt] = triangulo(t)

  for i=1:length(t)
    if (t(i) < 0 && t(i) >= -1)
      xt(i) = t(i)+1;
    else if (t(i) >= 0 && t(i) <= 1)
      xt(i) = -t(i)+1;
    else
      xt(i) = 0;
    endif
    endif
  endfor

