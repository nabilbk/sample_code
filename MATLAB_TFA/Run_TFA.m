function Run_TFA(lclist,templist)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Run the Trend Filtering Algorithm (TFA) on light curves specified in 
%'lclist' using template light curves specified in 'templist'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = Build_Temp(templist);
fid = fopen(lclist, 'r');
while feof(fid) == 0
    cur_star = fgetl(fid);
    TFA(cur_star, T);
end
fclose(fid);

    
    