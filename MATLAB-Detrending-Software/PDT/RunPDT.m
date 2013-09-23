function RunPDT(temps)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Appplies the Heiarchial Tree Clustering Algorithm from Kim et al. to
%produce a trendlist out of the potential trend curves listed in 'temps'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C = CorrelationMatrix(temps);
root = MakeTree(C);
clusters = [];
clusters = FindClusters(root, C,clusters);
MakeTemplates(clusters, temps);
return;