function [new_lc] = Zero_Avg(lc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Takes in light curve, replaces outliers with mean, and then zero averages
%light curve. (We use a 5sigma clipping value)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma = std(lc);
avg1 = mean(lc);
clipping = 5*sigma;
good = [];
new_lc = zeros(size(lc));

for i = 1:size(lc)
    if(abs(lc(i)-avg1) < clipping)
      good(end+1) = lc(i);
    end
end

avg2 = mean(good);
for i = 1:size(lc)
    if(abs(lc(i)-avg1) < clipping)
        new_lc(i) = lc(i)-avg2;
    else
        new_lc(i) = 0;
    end
end
return;