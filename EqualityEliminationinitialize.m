function [Equalp_c,Amatrixp_b]=EqualityEliminationinitialize(Equal,c,Amatrix,b,listofedge)
    Equalp=permutation(Equal,listofedge);
    Amatrixp=permutation(Amatrix,listofedge);
    Equalp_c=[Equalp,-c];
    Amatrixp_b=[Amatrixp,-b];
end