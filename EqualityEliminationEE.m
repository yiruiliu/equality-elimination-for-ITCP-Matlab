function [AA]= EqualityEliminationEE(E,A)
%eliminate bounded variables Dx'=c from Bx<=b
%where E=[D|-c],A=[B|-b]
AA=A;
[R,jb]=rref(E);
for i=1:length(jb)
    r=R(i,:);
    r(jb(i))=0;
    rr=find(r~=0);
    Aa=zeros(size(AA));
    for j=1:length(rr)
        c=AA(:,jb(i)).*-r(rr(j));
        Aa(:,rr(j))=c;
    end
    AA=AA+Aa;
end
AA(:,jb)=0;
end