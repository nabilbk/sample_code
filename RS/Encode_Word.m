function [encoded] = Encode_Word(v)
%Encodes a length 15 word according to RS(31,15)
encoded = gf(zeros(1,31), 5);
alpha = gf(2,5);
n = 31;
k = 15;

for i = 0:n-1,
    a = alpha^i;
    for j = 0:k-1,    
         encoded(i+1) = encoded(i+1)+ gf(v(j+1),5)*a^j;
    end    
end
return;
end

