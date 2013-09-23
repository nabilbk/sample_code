function MakeTrend(input,i)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Creates a trend curve given a cluster
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
out = strcat('Output/trend',num2str(i),'.txt');
fout = fopen(out, 'wt');
D = ReadLC(char(input));
OUT = [D(:,1)';D(:,2)'];
fprintf(fout, '%6f %6f\n',OUT);
fclose(fout);

