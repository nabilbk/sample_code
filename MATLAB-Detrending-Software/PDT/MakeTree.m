function[root] = MakeTree(C)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Takes in a correlation matrix for a set of light curves and produces a
%binary tree to be used in the heiarchial clustering algorithm of PDT.
%Details in Kim et al. (2008)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = length(C);
%initialize nodes list with leaves
for i = 1:n
    nodes(i) = tree_node;
    nodes(i).lclist = [i];
end
while length(nodes) > 1
    curd = 3;
    a = 0;
    b = 0;
    total = length(nodes);
    for i = 1:total-1
        for j = i+1:total
            newd = distance(nodes(i),nodes(j),C);            
            if newd < curd
                curd = newd;
                a = i;
                b = j;
           end
        end
    end
    nodes = Update_Nodes(nodes,a,b);
end
root = nodes(1);
return;

