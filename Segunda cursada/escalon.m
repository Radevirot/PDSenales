function x = escalon(t)


  for i=1:length(t)

    if (t(i) >= 0 && t(i) < 1)
      x(i) = 1;
    else
      x(i) = 0;
    endif

  endfor


