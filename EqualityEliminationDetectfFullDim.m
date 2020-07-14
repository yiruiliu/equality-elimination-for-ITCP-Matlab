function [X,FVAL] = EqualityEliminationDetectfFullDim(A,b)
f=[zeros(1,size(A,2)),1];
Anew=[A,ones(size(A,1),1)];
aa=[zeros(1,size(A,2)),1];
Anew=[Anew;aa];
bnew=[b;1];
LB=zeros(1,size(A,2));
LB=[LB,-Inf];
[X,FVAL1]=linprog(-f,Anew,bnew,[],[],LB,[]);
FVAL=-FVAL1;
end