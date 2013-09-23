function[d] = distance(a,b,C)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Returns the distance between nodes a and b. Distance is defined as the max
%distance between any two stars in a or b. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alist = a.lclist;
blist = b.lclist;
n = length(a.lclist);
m = length(b.lclist);
d = 0;
for i = 1:n
    star1 = alist(i);
    for j = 1:m
        star2 = blist(j);
        curd = 1-C(star1,star2);
        if (curd > d)
            d = curd;
        end
    end
end
return;