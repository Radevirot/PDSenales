function [xm, tm] = interpolador_sinc(tn, y, vieja_fm, nueva_fm, funcion)

  T = 1/vieja_fm; Ti = 1/nueva_fm;
  n = 0:length(tn)-1;

  tm = tn(1):Ti:tn(end)+T; %creo el nuevo vector de tiempos con los mismos
                            %extremos pero usando la frecuencia nueva

  xm = zeros(length(tm),1); %genero el vector de salidas con ceros para poder recorrerlo

  for m=1:length(xm)

  switch (funcion)
    case 'escalon'
      xm(m) = sum(y .* escalon( (Ti*m)/T - n ));
    case 'lineal'
      xm(m) = sum(y .* triangulo( (Ti*m - T*n)./T) );
    case 'sinc'
      xm(m) = sum(y .* mi_sinc_t( ((Ti*m)/T - n) , 0.5));
    otherwise
      error('escalon, lineal o sinc son los posibles interpoladores.')
  endswitch

  endfor

 % Nota extra:
 % Acá se me presentó un problema a la hora de usar la función interpolante del
 % escalón, porque es la única que no admite valores temporales negativos.
 % Yo inicialmente había tomado a T*n como un vector tn que simplemente contenía
 % los tiempos originales, creaba un vector tm basándome en los tiempos de tn
 % con la siguiente asignación: tm = tn(1):Ti:tn(length(tn))+T-Ti, y usaba
 % tm(m) dentro de las operaciones de interpolación.
 % El vector tm es necesario para la salida, ya que es el eje t nuevo, pero
 % el problema radica en usar tm(m) dentro de la función escalón.
 % La diferencia es que si uno usa bucles normales y hace las multiplicaciones,
 % no existen los tiempos negativos porque los índices de los FORs comienzan en
 % 1. Acá tenía dos opciones, o dezplazar los dos vectores (tn y tm) hacia la derecha
 % restando el mínimo (y teniendo que volver a desplazar hacia la izquierda),
 % o lo que me pareció más sencillo, crear un vector n que represente los
 % índices de los tiempos originales y usar las multiplicaciones Ti*m para los
 % tiempos nuevos y T*n para los antiguos, así todo queda positivo.
