function [C] = CorrelationMatrix(lclist)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Takes in a list of lightcurves and computes the correlation matrix C.
%Entry c_ij is the Pearson Correlation between light curves i and j 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen(lclist, 'r');
files = [];
i = 0;
while feof(fid) == 0;
    i = i+1;
    files(i,:) = fgetl(fid);
end
n = size(files);
n = n(1);
C = zeros(n,n);
for i = 1:n
    D = ReadLC(char(files(i,:)));
    x = D(:,2);
    for j = 1:n
        E = ReadLC(char(files(j,:)));
        y = E(:,2);
        C(i,j) = Pearson_Correlation(x,y);
    end
end
return;