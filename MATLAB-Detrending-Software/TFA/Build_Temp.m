function [T] = Build_Temp(tempfile)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Takes in a list of template light curves and builds a template matrix T
%TEMPLATE FILE FORMAT ASSUMED:
%   - Each line contains pathname to lightcurve's .dat file enclosed in ' '
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%First determine dimensions to preallocate memory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen(tempfile, 'r');
m = 0;
while feof(fid) == 0
    cur_star = fgetl(fid);
    m = m+1;
end
fclose(fid);
D = ReadLC2(cur_star);
lc = D(:,2);
n = length(lc);
T = zeros(m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Now build the template matrix T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen(tempfile, 'r');
i = 0;
while feof(fid) == 0
    cur_star = fgetl(fid);
    i = i+1;
    D = ReadLC2(cur_star);
    lc = D(:,2);
    lc = Zero_Avg(lc);
    T(i,:) = lc;
end
fclose(fid);
return;

    
    


    
    
    
    
