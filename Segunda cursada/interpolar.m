function [tm, xm] = interpolar(t, x, new_fm, func_interp)

  Ti = 1/new_fm;
  T = t(2)-t(1);
  tm = t(1):Ti:t(end)+T-Ti;
  xm = zeros(length(tm),1);

  for i = 1:length(xm)

    switch func_interp
      case 'sinc'
        xm(i) = sum(x.*mi_sinc((tm(i)-t)./T));
      case 'lineal'
        xm(i) = sum(x.*lineal((tm(i)-t)./T));
      case 'escalon'
        xm(i) = sum(x.*escalon((tm(i)-t)./T));
      otherwise
        disp('valor inválido de func_interp')
    endswitch

  endfor



