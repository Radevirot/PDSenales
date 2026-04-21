x = [2 3 8 5 1 3 5 3 6 9]
n = [1:10]

# 1
A = 2;
omega = 5;
T = 1;
[t, s] = senoidal(0, 10, 1/T, (omega/(2*pi)), 0, A);

y1 = [];

for i = 1:length(s)

  y1(i) = x(i)*s(i);

endfor

subplot(4,1,1);
plot(n,y1)

# 2
n0 = 3
for i = 1:length(x)
  k_inicio = max(i-n0,1);
  k_fin = min(i+n0,length(x));
  y2(i) = sum(x(k_inicio:k_fin));
endfor
subplot(4,1,2);
plot(n,y2)

# 3

y3 = x+2;
subplot(4,1,3);
plot(n,y3)

# 4

y4 = n.*x;
subplot(4,1,4);
plot(n,y4)


