function p = noiseId2(data, dmin, dmax)
%basic autocorrelation power law noise identification algorithm
%based on Rileys work.
Done = 0;
d = 0;
N = length(data);
while Done == 0
    z_hat = (1/N)*sum(data);
    r_top = zeros(1, N-1);
    r_bottom = zeros(1, N);
    for i = 1:N-1
        r_top(i) = (data(i) - z_hat)*(data(i+1) - z_hat);
    end
    for i = 1:N
        r_bottom(i) = (data(i)-z_hat)^2;
    end
    r_one = sum(r_top)/sum(r_bottom);
    delta = r_one/(1+r_one);
    if (d >= dmin) && ((delta < 0.25)||(d>=dmax))
        p = -2*(delta+d);
        Done = 1;
    else
        for i = 2:N
            data(i-1) = data(i) - data(i-1);
        end
        N = N-1;
        d = d+1;
    end
end
del = delta;
