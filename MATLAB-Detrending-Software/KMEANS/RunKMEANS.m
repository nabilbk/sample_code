function RunKMEANS(k,temps)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Applies KEMANS clustering to produce a set of trends out of the potential
%trend curves listed in 'temps'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clusters = Kmeans(k,temps);
MakeTemplates(k, clusters, temps);
