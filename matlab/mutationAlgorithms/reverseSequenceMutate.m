function [ memberOfPop ] = reverseSequenceMutate( memberOfPop, settings, determinedIndices )
%REVERSESEQUENCEMUTATE uses the RSM technique to mutate a member of the
%population. 
%   The RSM algorithm chooses two indices in the sequence and reverses the
%   order between the indices (inclusive)

if nargin == 2
    useDeterminedIndices = false;
elseif nargin == 3
    % the use of three arguments is for testing only.
    useDeterminedIndices = true;
else
    error('Too many inputs!')
end

if rand < settings.mutateProb
    if useDeterminedIndices
        indices = determinedIndices;
    else
        % subtracting 2 from length and adding 1 to the result ensures the
        % first and last index cannot be chosen, which will maintain the
        % first and last stop on the tour of cities. 
        indices = randperm(length(memberOfPop)-2, 2)+1;
    end
    indices = sort(indices);

    tmpMember = memberOfPop;
    memberOfPop(1:indices(1)-1) = tmpMember(1:indices(1)-1);
    memberOfPop(indices(1):indices(2)) = fliplr(tmpMember(indices(1):indices(2)));

    if indices(2) ~= length(memberOfPop)
        memberOfPop(indices(2)+1:end) = tmpMember(indices(2)+1:end);
    end
    
end 

end

