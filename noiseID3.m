function p_array = noiseID3(data, dmin, dmax)
%runs the RIley Noise ID algorithm over a dataset
%   running a moving average over the dataset to produce averages
%   at each tau window
%   data = input data
%   dmin = differencing dmim (default = 0)
%   dmax = differencing dmax (2 or 3 for Allan or Hadamard)
%   p_array = array with alpha = p for frequency and p+2 for phase data
tic
N = length(data);
M = round(N/128);
p_array = ones(M, 1);
p_array(1) = noiseId2(data, dmin, dmax);
for i = 2:M
    data2 = movAverage(data, i);
    p_array(i) = noiseId2(data2, dmin, dmax);
end
toc
end
