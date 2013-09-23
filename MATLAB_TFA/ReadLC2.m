function [D] = ReadLC2(input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reads in a space delimited light curve and returns vector m of brightness
%and vector s of uncertainties. It is assumed that brightness is in column
%2 and uncertainty in column 3. Remaining columns contain ancillary data to
%be used in detrending. 
%**FIRST LINE IS ASSUMED TO BE FREE OF DATA**
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D = dlmread(input);
D(1,:) = [];
return;

