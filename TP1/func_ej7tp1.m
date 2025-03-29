function [mean_var_columns, mean_var_rows] = func_ej7tp1(rea, fm, tini, tfin)

  % Calculo la cantidad de muestras usando la fm y los tiempos
  T = 1/fm;
  muestras = (tfin-tini)/T;
  % Genero la matriz de números aleatorios con distribución normal
  A = randn(rea,muestras);
  % Genero el eje t para graficar
  t = tini:T:tfin-T;

  % Calculo la media y la varianza de la matriz. Estas funciones devuelven
  % la media y varianza de todas las columnas como un vector fila.
  media = mean(A);
  varianza = var(A);

  mean_var_columns = [media ; varianza];

  % Esto es para graficar, si son más de 5 repeticiones hace 5, si son menos
  % hace la cantidad que haya.
  if (length(A(:,1)) >= 5)
  cant_graficos = 5;
  else
  cant_graficos = length(A(1,:));
  endif

  for i=1:cant_graficos
    subplot(cant_graficos,1,i);
    plot(t,A(i,:));
  endfor

  % Traspongo la matriz para calcular la ergodicidad. Ahora las columnas son
  % las realizaciones y las filas corresponden al mismo tiempo para cada señal.

  A = A';

  media = mean(A);
  varianza = var(A);

  mean_var_rows = [media', varianza'];

endfunction



