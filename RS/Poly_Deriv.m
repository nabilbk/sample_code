function [d] = Poly_Deriv(x)
%Calculates the formal derivative of polynomial x (Assuming the polynomial
%is over a field of characteristic 2)
n = length(x);
d = gf(zeros(1,n-1),5);
for i = 1:n-1
    if(mod(n-i,2) ~= 0)
        d(i) = x(i);
    else
        d(i) = 0;
    end
end
d = Remove_Zeros(d);
return;
end

