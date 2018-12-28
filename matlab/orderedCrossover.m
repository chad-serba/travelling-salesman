function [ child ] = orderedCrossover( parent1, parent2 )
%ORDEREDCROSSOVER performs an ordered crossover on two parents to generate
%an offspring

if length(parent1) ~= length(parent2)
    error('Parents must be the same length!')
end


subset = randperm(length(parent1)-2, 2)+1; % generate two indices to choose as the subset of parent 1, but do not allow the first or last index to be chosen.
subset = sort(subset); % make sure it is in ascending order

child = zeros(1, length(parent1));
child(subset(1):subset(2)) = parent1(subset(1):subset(2));

p2Idx = 1;
for ii = 1:length(child)
    
    if child(ii) == 0
        
        while ismember(parent2(p2Idx), child) && (p2Idx < length(parent2)) % the length part ensures the lasat index of child will be the last index of parent2 (which should also be the first index of both)
            p2Idx = p2Idx + 1;
        end
        
        child(ii) = parent2(p2Idx);
        p2Idx = p2Idx + 1;
    end

end

