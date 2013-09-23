disp('Calculating correlation matrix...');
C = CorrelationMatrix('pot_tempsH.txt');
disp('Generating binary tree...');
root = MakeTree(C);
disp('Determining clusters');
clusters = [];
clusters = FindClusters(root,C,clusters);
disp('Determining templates');
MakeTemplates(clusters, 'pot_tempsH.txt');


