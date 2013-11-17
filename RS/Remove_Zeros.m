function [p,d] = Remove_Zeros(x)
%Remove Leading Zeros and Return polynomial along with degree
n = length(x);
i = 1;
while (x(i) == 0 && i < n)
  i = i+1;
end
d = n-i;
p = x(i:n);
return
end

