function [ShOB1,ShOB2,linrows]=AddconstraintsTopAndBottom_indep(ncinstance,dimofProj)
    [ShOB1,ShOB2]=GenShannonUnBounded(ncinstance{3});
    linrows=[];
    if size(ncinstance{1},2) > 0
        i=size(ShOB1,1)+1;
        for j=1:1:size(ncinstance{1},2)
            con=ncinstance{1}{j};
            conlin=zeros(1,2^ncinstance{3}-1);
            conlin(Yiruiset2int(con{1}))=-1;
            conlin(Yiruiset2int(con{2}))=1;
            ShOB1(size(ShOB1,1)+1,:)=conlin;
            ShOB2(size(ShOB2,1)+1)=0;
            linrows(length(linrows)+1,1)=i;
            i=i+1;
        end
        conlin=zeros(1,2^ncinstance{3}-1);
        if ncinstance{2}>1
            for j=1:1:ncinstance{2}
                conlin(Yiruiset2int([j]))=-1;
            end
            conlin(Yiruiset2int([1:1:ncinstance{2}]))=1;
            ShOB1(size(ShOB1,1)+1,:)=conlin;
            ShOB2(size(ShOB2,1)+1)=0;
            linrows(length(linrows)+1,1)=i;
            i=i+1;
        end
    end
    conlin=zeros(1,2^ncinstance{3}-1);
    conlin([1:1:dimofProj])=1;
    ShOB1(size(ShOB1,1)+1,:)=conlin;
    ShOB2(size(ShOB2,1)+1)=dimofProj;
end
