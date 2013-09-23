function TFA2(starfile,T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Runs TFA on the star whose light curve is in 'starfile', using the
%template T. Writes out coefficients and TFA model.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SETUP FILENAMES
name = GetName(starfile);
model = strcat('Output/TFA_Models/',name,'.tfa.model');
coefficients = strcat('Output/TFA_Coefficients/',name,'.tfa.coeff');
fout1 = fopen(coefficients, 'wt');
fout2 = fopen(model, 'wt');
%DETERMINE COEFFICIENTS AND FILTER 
D = ReadLC2(starfile);
Y = D(:,2);
dates = D(:,1);
S = D(:,3);
n = size(D);
n = n(2);
m = size(T);
m = m(1);
if n >3
    for i = 4:n
        T(m+i,:) = D(:,i);
    end
end
c = Find_c(Y,S,T);
%c = Make_Filter(Y,T);
F = c'*T;
%PRINT OUT COEFFICIENTS AND FILTER
fprintf(fout1,'%6f\n',c);
OUT = [dates'; Y';F;S'];
fprintf(fout2, '%6f %6f %6f %6f\n', OUT);
fclose(fout1);
fclose(fout2);
end




