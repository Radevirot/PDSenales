function [xt,t] = rampa(tini,tfin,tmax,fm,pendiente)

  T = 1/fm;
  t = tini:T:tfin-T;  %tfin-T para que no muestre el último número

  for i=1:length(t)

    if (t(i)<0 || t(i)>tmax)
      xt(i) = 0;
    else
      xt(i) = t(i)*pendiente;
    endif

  endfor

endfunction
