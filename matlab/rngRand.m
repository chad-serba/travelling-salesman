function [ vec ] = rngRand( a, b, rw, cl )
%return a matrix of values within range [a,b] with rw rows and cl columns

for jj = 1:rw
    
    for ii = 1:cl
        
        vec(jj,ii) = (b-a)*rand(1,1) + a;
        
    end
    
end

end

