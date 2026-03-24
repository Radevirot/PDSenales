function [t, x] = senoidal(tini, tfin, fm, fs, fase, A)

  T = 1/fm;
  t = tini:T:tfin-T;
  x = A*sin(2*pi*fs*t+fase);



