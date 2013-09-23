function MakeTemplates(clusters, lclist)
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
%DETERMINE CLUSTER REPRESENTATIVES
num_reps = 0;
n = size(clusters);
n = n(1);
for i = 1:n
    max = 1;
    while(clusters(i,max) ~= 0)
        max = max+1;
    end
    if (max >= 3)
       sig = 100;
       rep = 0;
        for j = 1:max-1
            D = ReadLC(char(files(clusters(i,j),:)));
            lc = D(:,2);
            cursig = std(lc);
            if (cursig < sig)
                rep = j;
                sig = cursig;
            end
        end
       num_reps = num_reps+1;
       MakeTrend(files(clusters(i,rep),:),num_reps);
    end
end 
return;
        