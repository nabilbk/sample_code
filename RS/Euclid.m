function [x,y] = Euclid(a,b,mu,v)
%Performs Euclid's algorithm 
oldr = a;
curr = b;
oldv = gf(0,5);
curv = gf(1,5);
degv = 100; 
degr = 100;

while(degv > mu) || (degr > v)
    [q,r] = deconv(oldr,curr);
    newr = r;
    newv = Polynomial_Add(oldv,-conv(q,curv));    
    [newv, degv] = Remove_Zeros(newv);
    [newr,degr] = Remove_Zeros(newr);
    
    oldv = curv;
    oldr = curr;
    curv = newv;
    curr = newr;
end
       
x = curv;
y = curr;
end

