function[c] = Find_c(Y,S,T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Solve for TFA coefficients using the uncertainty weighting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = size(S);
n = n(1);
W = zeros(n,n);
for i = 1:n
    W(i,i) = 1/S(i);
end
modY = Zero_Avg(Y);
modY = modY'*W;
modT = T*W;
G = pinv(modT*modT');
h = modT*modY';
c = G*h;
return;



    