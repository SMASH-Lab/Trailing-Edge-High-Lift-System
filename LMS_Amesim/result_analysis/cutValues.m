function [ v ] = cutValues( v , q_max, q_min)

N=size(v,1);
i=1;
prev=0;
while (i<=N)
    if(v(i,1)> q_max)
        v(i,1)=prev;
    elseif(v(i,1)< q_min)
        v(i,1)=prev;
    else
        prev=v(i,1);
    end
    i=i+1;
    
end


end

