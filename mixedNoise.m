function [x] = mixedNoise(steps, alpha_varianceStruct)
% S is a struct containing the noise processes variance and alpha coeffs
S = alpha_varianceStruct;
% N is the length of the desired simulation
N = length(S.alpha);
seperateNoiseRuns = zeros(steps, N);
for i = 1:N
    seperateNoiseRuns(:, i) = f_alpha_gaussian(steps, S.variance(i),...
        S.alpha(i));
end
%Add the noise runs together to get the cumulative effect.
%Assume this is OK?
x = sum(seperateNoiseRuns, 2);
