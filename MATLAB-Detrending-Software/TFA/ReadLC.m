function [m, s, dates] = ReadLC(input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reads in a space delimited light curve and returns vector m of brightness
%and vector s of uncertainties. It is assumed that brightness is in column
%2 and uncertainty in column 3.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D = dlmread(input);

dates = D(:,1);
dates = dates(2:size(dates));
m = D(:,2);
m = m(2:size(m));
s = D(:,3);
s = s(2:size(s));
return;

