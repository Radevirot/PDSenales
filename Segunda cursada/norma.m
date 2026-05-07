function xp = norma(x,p)
  # La norma p de la señal x.

 if(strcmp(p, 'inf'))
  xp = max(abs(x));
  else
  xp= (sum(abs(x).^p))^(1/p);
endif
endfunction
