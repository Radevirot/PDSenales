function cuantizedxt = cuantizacion(xt, H, N)


for i=1:length(xt)

  if (xt(i)<0)
    xt(i) = 0;
   else
    if (0 <= xt(i) && xt(i) < (N-1)*H)
    xt(i) = H*ceil(xt(i)/H);
   else
    if (xt(i) >= (N-1)*H)
    xt(i) = (N-1)*H;
  endif
  endif
  endif
  cuantizedxt = xt;

endfor
