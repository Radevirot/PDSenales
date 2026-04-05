samples_and_realizations = 10000

A = randn(samples_and_realizations);

% --- Verificamos estacionariedad ---
disp('Verificamos estacionariedad')

for i=1:length(A)

  mean_vector(i) = sum(A(i,:))/length(A);
  variance_vector(i) = sum((A(i,:)-mean_vector(i)).^2)/length(A);

endfor

  mean_means = sum(mean_vector)/length(mean_vector)
  mean_vars = sum(variance_vector)/length(variance_vector)

disp('Verificamos ergodicidad')

A = A';

for i=1:length(A)

  mean_vector(i) = sum(A(i,:))/length(A);
  variance_vector(i) = sum((A(i,:)-mean_vector(i)).^2)/length(A);

endfor

  mean_means = sum(mean_vector)/length(mean_vector)
  mean_vars = sum(variance_vector)/length(variance_vector)
