function [AA2,b1,EqualforProj,c1,indepedge]=EqualityEliminationFromNet_indep(ncinstance,listofedge)
[ShOB1,ShOB2,linrows]=AddconstraintsTopAndBottom_indep(ncinstance);
Equal = ShOB1(linrows,:);
diff = setdiff(1:size(ShOB1),linrows);
Amatrix = ShOB1(diff,:);
c = zeros(length(linrows),1);
b = ShOB2(diff);
[AA2,b1,EqualforProj,c1,indepedge]=EqualityEliminationMain(Equal,c,Amatrix,b,listofedge);
end