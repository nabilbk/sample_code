function[F] = Make_Filter(Y,T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Takes in a light curve to be filtered and the normal matrix of the
%template set and returns filter F
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
modY = Zero_Avg(Y);
G = inv(T*T');
h = T*modY;
F = G*h;
return;

