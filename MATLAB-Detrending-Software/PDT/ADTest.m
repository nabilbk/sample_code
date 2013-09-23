function[result] = ADTest(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Performs the Anderson-Darling test of normality on vector X. Specifically,
%the result is 1 if the vector X passes the AD test with p-value .1, 0 if
%not
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xsort = sort(X);
avg = mean(Xsort);
sig = std(Xsort);
n = length(Xsort);
Y = zeros(1,n);
for i = 1:n
    Y(i) = (Xsort(i)-avg)/sig;
end
S = 0;
for i = 1:n
    S = S+(2*i-1)*(log(CDF(Y(i)))+log(1-CDF(Y(n+1-i))));
end
A = -n-S/n;
A = A*(1+4/n-25/n^2);
if(A > .632)
    result = 0;
else
    result = 1;
end
return;
