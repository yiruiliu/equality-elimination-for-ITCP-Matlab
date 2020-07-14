function [A,b] = GenShannonUnBounded(n)
for i=1:1:n
    nset_i=[1:1:n];
    nset_i=setdiff(nset_i,[i]);
    ineq=zeros(1,2^n);
    ineq(Yiruiset2int([1:1:n])+1)=1;
    ineq(Yiruiset2int(nset_i)+1)=-1;
    A(i,:)=ineq;
end
pairs=combnk([1:1:n],2);
[azb,bzb]=size(pairs);
for i=1:1:azb
    p=pairs(i,:);
    nset_ij=[1:1:n];
    nset_ij=setdiff(nset_ij,pairs(i,:));
    for j=1:1:length(nset_ij)
        Klist=combnk(nset_ij,j);
        [azb1,azb2]=size(Klist);
        for k=1:1:azb1
            ineq=zeros(1,2^n);
            ineq(Yiruiset2int(union(Klist(k,:),p(1)))+1)=1;
            ineq(Yiruiset2int(union(Klist(k,:),p(2)))+1)=1;
            ineq(Yiruiset2int(union(Klist(k,:),p))+1)=-1;
            ineq(Yiruiset2int(Klist(k,:))+1)=-1;
            A(size(A,1)+1,:)=ineq;
        end
    end
    ineq=zeros(1,2^n);
    ineq(Yiruiset2int(p(1))+1)=1;
    ineq(Yiruiset2int(p(2))+1)=1;
    ineq(Yiruiset2int(p)+1)=-1;
    A(size(A,1)+1,:)=ineq;
end
A=-A;
A(:,1)=[];
b=zeros(size(A,1),1);
end