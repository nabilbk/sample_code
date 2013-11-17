function [S] = Syndrome(R)
%Computes the Syndrome Polynomial S(x) of the recieved vector R
n = 31;
k = 15;
r = n-k;
alpha = gf(2,5);
S = gf(zeros(1,r),5);

for j = 1:r,
    a = alpha^j;
    for i = 0:n-1,    
         S(r-j+1) = S(r-j+1)+ R(i+1)*a^i;
    end    
end
S = Remove_Zeros(S);
return;
end

