function x = lineal(t)


  for i=1:length(t)

    if (abs(t(i)) < 1)
      x(i) = 1 - abs(t(i));
    else
      x(i) = 0;
    endif

  endfor

