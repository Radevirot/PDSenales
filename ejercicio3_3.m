%hora de sufrir

clear all; clc;

% buscamos aproximar una función y(t) definida como -1 para t<0 y 1
% para t≥0 usando polinomios de Legendre, que son ortonormales entre
% -1 y 1.

t = -1:0.01:1; %tiempo discretizado
y = []; %inicializo vector de valores de la función
for i=1:length(t)
  if t(i)<0
    y(i)=-1;
  else
    y(i)=1;
  endif
endfor

% del desarrollo de los polinomios de Legendre en el libro sabemos que
% usando 4 coeficientes para aproximar la función y(t) obtenemos dos
% α, siendo α1 = sqrt(3/2) y α3 = -sqrt(37/2).

alpha1 = sqrt(3/2); alpha3 = -sqrt(7/32);

% definimos ahora una función anónima que representa la aproximación
% usando la combinación lineal entre los α y los términos ortonormales
% de los polinomios de Legendre, la haremos con α1 y α3 variables para
% poder utilizarla en el segundo inciso.

f_aprox = @(a1,a3,t) a1.*(sqrt(3/2).*t)+a3.*(sqrt(7/2).*((5/2).*t.^3-(3/2).*t));

% usamos la función para calcular el y_aprox con los α calculados en
% el ejemplo

y_aprox = f_aprox(alpha1,alpha3,t);

% las grafico para ver la diferencia de aproximación visualmente

figure;
plot(t,y,'r;y;'); hold on; grid on; grid minor;
plot(t,y_aprox,'b;y_{aprox};')

% vamos a calcular el error cuadrático total haciendo la norma euclídea
% de la diferencia y-y_aprox elevada al cuadrado

f_ECT = @(ap)(norm(y-ap)).^2;
ECT_1 = f_ECT(y_aprox);
printf("El error cuadrático total para 3 términos es %d\n", ECT_1)

% arrancamos el inciso 2:
% vamos a crearnos unos vectores con varios valores para α1 y α3.

alpha1_vec = [alpha1-0.4 alpha1-0.3 alpha1-0.2 alpha1-0.1 alpha1 alpha1+0.1 alpha1+0.2 alpha1+0.3 alpha1+0.4];
alpha3_vec = [alpha3-0.4 alpha3-0.3 alpha3-0.2 alpha3-0.1 alpha3 alpha3+0.1 alpha3+0.2 alpha3+0.3 alpha3+0.4];

% para cada par de alfas tenemos que calcular la aproximación y el error
% cuadrático total.
ECT_matrix = [];

for i=1:length(alpha1_vec)
  for j=1:length(alpha3_vec)
    ECT_matrix(i,j) = f_ECT(f_aprox(alpha1_vec(i),alpha3_vec(j),t));
  endfor
endfor

% bien, ahora vamos a crear un maravilloso gráfico 3d para ver si efectivamente
% el valor del medio es el menor!!

figure;
surf(alpha1_vec,alpha3_vec,ECT_matrix)

% perfecto, se ve claramente que el menor error está en el centro, que
% corresponde a los alfa originales calculados


% ahora, habiendo calculado los términos de los polinomios de Legendre para
% n=4 y n=5, y habiendo determinado que α4 = 0 y α5 = sqrt(22)/16, vamos
% a calcular la nueva y_aprox utilizando el nuevo término.
% el cálculo de los alfas, indicando cuáles son los términos del polinomio
% se encuentran en la imagen "cálculo de alfas.png"

alpha5 = (sqrt(22)/16);

f_aprox_2 = @(t) alpha1.*(sqrt(3/2).*t)+alpha3.*(sqrt(7/2).*((5/2).*t.^3-(3/2).*t))+alpha5.*((1/8).*sqrt(11/2).*(15.*t-70.*t.^3+63.*t.^5));

y_aprox_2 = f_aprox_2(t);

ECT_2 = f_ECT(y_aprox_2);

printf("El error cuadrático total para 5 términos es %d\n", ECT_2)

% es más bajo! voy a suponer que eso significa que hice bien los cálculos
