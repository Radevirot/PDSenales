function [P, P_dB] = potencia_aproximada(xt)

  N = length(xt); % N es cantidad de muestras

  suma = sum((abs(xt).^2)); % | Fórmula de
  P = suma/N;               % | potencia

  P_dB = 10*log10(P);       % Potencia en decibeles.

endfunction












