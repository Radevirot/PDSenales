#Ejercicio 4
clc;
clear all;
clf;

#Sistema continuo a utilizar
H=@(s) 12500.*s./((44.*s.^2)+(60625.*s)+625*10^4);

#graficamos H
#Como es una funcion de Laplace, la evaluamos en jw para obtener la respuesta en frecuencia
w_max=5000;
w=0:w_max;
s=j*w;
mag_h=abs(H(s)); #Respuesta en frecuencia del sistema.

#Convierto a f para graficar en hz, es mas entendible asi
f=w/(2*pi);
plot(f,mag_h);
grid on;
hold on;
xlabel('f(hz)');
ylabel('|H(jw)|');

#Obtenemos la frecuencia de corte
#Con el despeje a mano llegamos a que la magnitud de la frecuencia buscada
#Tiene que ser 1/2 de la frecuencia maxima
max_magnitud=max(mag_h);
indice_f_corte=find(mag_h>=max_magnitud/2,1,'last');
f_corte=f(indice_f_corte);
plot(f(indice_f_corte),max_magnitud/2,'*')

#El ejercicio pide 4 veces esta frecuencia de corte
T_corte=1/(f_corte*4);

#Definimos Z

#Aca hay que pasar a el dominio Z, digital discretizado
#Por lo tanto, w deja de ser una frecuencia angular por segundo
#w pasa a ser radianes/muestra, es decir, va de 0 a pi por Nysquist
w=0:pi/w_max:pi; #Divido pi/w_max para tener la misma cantidad de puntos que en la funcion original
z=e.^(j*w);

#------Transformacion de euler-----#
s_euler= (1-(z.^-1))./T_corte;
H_euler=H(s_euler);
plot(f,abs(H_euler));

#------Transformacion de Bilineal-----#
s_bili= (2/T_corte).*((1-(z.^-1))./(1+(z.^-1)));
H_bili=H(s_bili);
plot(f,abs(H_bili));
legend('Funcion Original','H de corte','Transformacion de EULER','Transformacion Bilineal');

#Analizando la respuesta en frecuencia de ambas señales
#Euler va bien en frecuencias bajas, tiene una morfologia similar en estas
#Bilineal sigue mas a la original, pero luego de 200 hz Decae muy rapidamente
