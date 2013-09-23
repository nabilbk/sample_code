function[clusters] = FindClusters(curnode,C,clusters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Takes in a node from binary tree and correlation matrix C and determines
%clusters recursively.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = curnode.lclist;
n = length(x);
m = n*(n-1)/2;
clist = zeros(1,m);
k = 1;
for i = 1:n-1
    for j = i+1:n
    clist(k) = .5*log((1+C(x(i),x(j)))/(1-C(x(i),x(j))));
    k = k+1;
    end
end
result = ADTest(clist);
if (result == 1) || (n <= 2)
    v = zeros(1,length(C));
    v(1:n) = x;
    count = size(clusters);
    count = count(1);
    clusters(count+1,:) = v;
    return;
else
    clusters = FindClusters(curnode.left, C, clusters);
    clusters = FindClusters(curnode.right,C,clusters);
end


    

