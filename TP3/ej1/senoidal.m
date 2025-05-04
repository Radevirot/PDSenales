function [xt, t] = senoidal(A, tini, tfin, fm, fs, fase)

  T = 1/fm;
  t = tini:T:tfin-T;  %tfin-T para que no muestre el último número
  xt = A*sin(2*pi*fs*t+fase);

  % usar stem(x,y) para ver la discretización
