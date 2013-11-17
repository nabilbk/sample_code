function [z] = Polynomial_Add(x,y)
%Allows addition of polynomials of uneven length
n = length(x)-length(y);
newy = gf(zeros(1,length(y)+abs(n)),5);
newx = gf(zeros(1,length(x)+abs(n)),5);
if n > 0  
    for i = 1:n
        newy(i) = gf(0,5);
    end
    for i = 1:length(y)
        newy(i+abs(n)) = y(i);
    newx = x;
    end
end
if n<0      
    for i = 1:-n
        newx(i) = gf(0,5);
    end
    for i = 1:length(x)
        newx(i+abs(n)) = x(i);
    newy = y;
    end
if n == 0
    newy = y;
    newx = x;
end

z = newx+newy;
return;
end

