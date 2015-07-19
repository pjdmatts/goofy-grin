function B = movAverage(A, n)
temp = A;
temp_smoothed = conv(temp, ones(n, 1)/n);
%temp = temp_smoothed;
temp = temp_smoothed(n:n:(end-n));
B = temp;
