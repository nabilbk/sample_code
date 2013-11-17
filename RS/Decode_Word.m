function [D,E] = Decode_Word(R)
%Decodes the recieved vector R
n = 31;
k = 15;
r = n-k;
t = r/2;
alpha = gf(2,5);
E = gf(zeros(1,31),5);
D = gf(zeros(1,31),5);
S = Syndrome(R);
if (S == 0)
    D = R;
    E = 0;
    D = ifft(D);
    D = D(1:15);
    return;
end
p = gf([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],5);
[v,r] =Euclid(p,Remove_Zeros(S),t,t-1);
v_0 = polyval(v,0);
v = v/v_0;
r = r/v_0;
vd = Poly_Deriv(v);
for i = 0:n-1
    if (polyval(v,alpha^(-i)) == 0)
        E(i+1) = -polyval(r,alpha^(-i))/polyval(vd,alpha^(-i));
    else
        E(i+1) = 0;
    end
end
for i = 1:n
    D(i) = R(i)-E(i);
end
D = ifft(D);
D = D(1:15);
return
end

