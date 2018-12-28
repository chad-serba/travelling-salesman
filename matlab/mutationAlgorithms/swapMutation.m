function [ memberOfPop ] = swapMutation( memberOfPop, settings )
%MUTATE uses a swap mutation to mutate a member of a population. Settings
%is a structure which contains the probability of mutation


if rand < settings.mutateProb % we should mutate
    
    idxToSwap = randperm(length(memberOfPop)-2, 2)+1; % randomly select two indices from the member, but do not allow the first or last index. 
    
    tmp1 = memberOfPop(idxToSwap(1));
    tmp2 = memberOfPop(idxToSwap(2));
    
    memberOfPop(idxToSwap(1)) = tmp2;
    memberOfPop(idxToSwap(2)) = tmp1;
    
end
    



end

