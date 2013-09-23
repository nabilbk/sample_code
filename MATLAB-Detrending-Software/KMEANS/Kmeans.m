function [clusters] = Kmeans(k,lclist)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function that clusters light curves using the K Means algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
D = ReadLC(char(files(1,:)));
s = D(:,2);
s = length(s);
%INITIALIZE CENTERS
centers = GetCenters(n,k);
disp(n);
C = zeros(k,s);
for i = 1:k
    D = ReadLC(char(files(centers(i),:)));
    Y = D(:,2);
    Y = Zero_Avg(Y);
    C(i,:) = Y;
end
%MAIN LOOP
clusters = zeros(1,n);
swap_count = 1;
while (swap_count > 0)
    swap_count = 0;
    %ASSIGN LIGHT CURVES TO CLUSTERS BASED ON DISTANCES TO CENTERS
    for i = 1:n
        D = ReadLC(char(files(i,:)));
        X = D(:,2);
        X = Zero_Avg(X);
        curd = 10000;
        for j = 1:k
            Y = C(j,:);
            newd = Distance(X,Y);
            if (newd < curd)
                curd = newd;
                newc = j;
            end
        end
        if (newc ~= clusters(1,i))
            clusters(1,i) = newc;
            swap_count= swap_count+1;
        end
    end
    %UPDATE CENTERS
    C = zeros(k,s);
    count = zeros(1,k);
    for i = 1:n
        cur = clusters(i);
        D = ReadLC(char(files(i,:)));
        curlc = D(:,2);
        curlc = Zero_Avg(curlc);
        count(1,cur) = count(1,cur)+1;
        C(cur,:) = C(cur,:)+curlc';
    end
    for i = 1:k
        C(i,:) = C(i,:)*count(1,i)^(-1);
    end
    disp('Number of new assignments: ');
    disp(swap_count);
end
return;
    