function [X,FVAL] = EqualityEliminationDual(A,b)

%Komeiji Fukuda's lecture notes chapter 8.3 dual LP
Aprime=A';
Aprime=[Aprime,zeros(size(Aprime,1),1)];
aa=ones(1,size(Aprime,2));
Aprime=[Aprime;aa];
bprime=[zeros(size(Aprime,1)-1,1);1];
LB=zeros(size(Aprime,2),1);
f=[b',1];
[X,FVAL]=linprog(f,[],[],Aprime,bprime,LB,[]);
end

