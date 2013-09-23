function [centers] = GetCenters(n, k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Given n light curves, produces a set of k centers at random
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
centers = zeros(1,k);
lclist = zeros(1,n);
for i = 1:n
    lclist(1,i) = i;
end
for i = 1:k
    m = length(lclist);
    newc = ceil(m*rand());
    centers(1,i) = lclist(1,newc);
    lclist(newc) = [];
end
return

