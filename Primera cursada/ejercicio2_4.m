clear all; clc;

%generamos las 3 señales
fm = 100; fase = 0; tini=0; tfin=1; A=1;

[a, t] = senoidal(A, tini, tfin, fm, 2, fase);
[b, t] = ondacuadrada(A, tini, tfin, fm, 2, fase);
[c, t] = senoidal(A, tini, tfin, fm, 4, fase);

interno_ab = dot(a,b) % no ortogonal
interno_ac = dot(a,c) % ortogonal
interno_bc = dot(b,c) % ortogonal

A = fft(a);
B = fft(b);
C = fft(c);

%no necesito desplazar los valores si todos siguen la misma regla (fpos primero,
%fneg al final)

interno_AB = dot(A,B) % no ortogonal
interno_AC = dot(A,C) % ortogonal
interno_BC = dot(B,C) % ortogonal

%vamos a probar también con las magnitudes de las transformadas
interno_mag_AB = dot(abs(A),abs(B)) % no ortogonal
interno_mag_AC = dot(abs(A),abs(C)) % ortogonal
interno_mag_BC = dot(abs(B),abs(C)) % ortogonal


%---------- ahora redefinimos c ----------
disp('---------- AHORA SE REDEFINE C ------------')

[c, t] = senoidal(1, tini, tfin, fm, 3.5, fase);

interno_ac = dot(a,c) % ortogonal

C = fft(c);

interno_AC = dot(A,C) % ortogonal

%magnitud de la transformada
interno_mag_AC = dot(abs(A),abs(C)) % no ortogonal?

%analizar pq no es ortogonal después de transformarla



