function [xt] = escalon(t)

  xt = (t >= 0) & (t < 1);

  %for i=1:length(t)
  %  if (t(i) >= 0 && t(i) < 1)
  %    xt(i) = 1;
  %  else
  %    xt(i) = 0;
  %  endif
  %endfor
