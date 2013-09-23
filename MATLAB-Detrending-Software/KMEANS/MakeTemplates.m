function MakeTemplates(k,clusters, lclist)
%Produces a template list given clusters. 

%READ IN LCLIST
fid = fopen(lclist, 'r');
files = [];
i = 0;
while feof(fid) == 0;
    i = i+1;
    files(i,:) = fgetl(fid);
end
fclose(fid);
n = length(files);
%DETERMINE CLUSTER REPRESENTATIVES
Sigs = zeros(1,k);
Reps = [];
for i = 1:k
    Sigs(1,i) = 10;
end
for i = 1:n
    D = ReadLC(char(files(i,:)));
    lc = D(:,2);
    sig = std(lc);
    c = clusters(1,i);
    if(sig < Sigs(1,c))
        Reps(c,:) = files(i,:);
        Sigs(1,c) = sig;
    end
end
for i = 1:k
    MakeTrend(char(Reps(i,:)),i);
end
return;
        