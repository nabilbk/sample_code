function [d] = Distance(X,Y)
%Computes Euclidean Distance between vectors X and Y. (Assumes they are of
%the same dimension.)
n = length(X);
d = 0;
for i = 1:n
    d = d+(X(i)-Y(i))^2;
end
d = sqrt(d);
return;