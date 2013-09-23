function[nodes] = Update_Nodes(nodes,a,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Update nodes list by combining nodes a and b into one node, and creating a
%new nodes list which replaces a and b with the combined node
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rtnode = nodes(a);
lftnode = nodes(b);
c = tree_node;
c.lclist = [rtnode.lclist,lftnode.lclist];
c.right = rtnode;
c.left = lftnode;
if(a < b)
    nodes(b) = [];
    nodes(a) = [];
else
    nodes(a) = [];
    nodes(b) = [];
end
nodes(end+1) = c;
return;
