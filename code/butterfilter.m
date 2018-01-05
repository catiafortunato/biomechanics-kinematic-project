function [filtered_data] = butterfilter(n,fc,data,fs)
%butterfilter applies a double pass butterworth filter to the data received
% inputs
% n: order of the filter
% Wn:cut off frequency for the filter in Hertz
% data: matrix with the data about the laboratory
%fs: sampling frequency
% output
%filtered_data: matrix with the data already filtered

[x,y] = butter(n,fc/(fs/2)); %fc/(fs/2)=Wn
filtered_data = filtfilt(x,y,data);

end

