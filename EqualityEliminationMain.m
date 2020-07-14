% Ax<=b, Amatrix = A
% Dx=c, Equal = D, c = c
% listofedges = {[1],[2],..,[s],[1,3],[3,5],..} set of singletons and
% subset entropies
function [AA2,b1,EqualforProj,c1,indepedge]=EqualityEliminationMain(Equal,c,Amatrix,b,listofedge)
AllEqual=[];
[Equalp_c,Amatrixp_b]=EqualityEliminationinitialize(Equal,c,Amatrix,b,listofedge);
FVAL=0;
AllEqual=[AllEqual;Equalp_c];
while FVAL==0
    [AA]=EqualityEliminationEE(Equalp_c,Amatrixp_b);
    A1=AA;
    A1(:,size(A1,2))=[];
    b1=-AA(:,size(AA,2));
    [X,FVAL]=EqualityEliminationDetectfFullDim(A1,b1);
    if FVAL==0
         [X1,FVAL1]=EqualityEliminationDual(A1,b1);
         AA1=[A1,-b1];
         Equalp_c=AA1(find(X1>0),:);
         AllEqual=[AllEqual;Equalp_c];
         Amatrixp_b=AA1;
         Amatrixp_b(find(X1>0),:)=[];
    end
end
AA1=A1;
dependent = max(A1)==0&min(A1)==0;
AA1(:,dependent) = [];
dependent_short = dependent(size(A1,2)-length(listofedge)+1:size(A1,2));
dreverse = dependent_short(end:-1:1);
indepedge = listofedge;
for i = 1:length(dreverse)
    if dreverse(i) == 1
        indepedge{i} = 0;
    end
end
RAllEqual = rref(AllEqual);
EqualforProj = [];
for i = 1 : size(RAllEqual,1)
    for j = 1 : size(RAllEqual,2)
        if RAllEqual(i,j) == 1
            if j  > size(RAllEqual,2)-length(listofedge) - 1
                EqualforProj = [EqualforProj;RAllEqual(i, size(RAllEqual,2)-length(listofedge):size(RAllEqual,2))];
            end
            break
        end
    end
end
if size(EqualforProj) > 0
    c1 = EqualforProj(:,size(EqualforProj,2));
    EqualforProj(:,size(EqualforProj,2)) = [];
    EqualforProj = EqualforProj(:,end:-1:1);
else
    c1 = [];
end
index3=[1:size(AA1,2)];
index3=sort(index3,'descend');
AA2=AA1(:,index3);
end