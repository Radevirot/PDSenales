#Ejercicio 3
clc;
clear all;
clf;
pkg load signal;

#Punto A
h_num = [1 -2 2 -1];
h_denom = [1 -1.7 0.8 -0.1];
zplane(h_num,h_denom)
#Tiene 2 polos dentro del circulo, y uno en el borde, que es anulado por un cero
#el sistema es ESTABLE
disp('Raices del Numerador');
roots(h_num)
disp('Raices del Denominador');
roots(h_denom)

#Punto B
#y[n] - 1.7y[n-1] + 0.8y[n-2] - 0.1y[n-3]
#x[n] - 2x[n-1] + 2x[n-2] - x[n-3]
#y[n] = x[n] - 2x[n-1] + 2x[n-2] - x[n-3] + 1.7y[n-1] - 0.8y[n-2] + 0.1y[n-3]
#Sacamos la respuesta al sistema con filter
n=100;
delta=zeros(1,n);
delta(1)=1;
h=filter(h_num,h_denom,delta);
x=1:100;
figure;
stem(x,h)
grid on
hold on
