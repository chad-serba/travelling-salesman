function [ bestOrder, totalLen ] = nearestNeighborTS( startIdx, locations )
%NEARESTNEIGHBOR Uses the nearest neighbor algorithm to solve the
%travelling salesman problem. 


bestOrder(1) = startIdx; % first in order is the starting index
totalLen = 0;
while length(bestOrder) < length(locations(:,1))
    
    bestDist = realmax;
    for jj = 1:length(locations(:,1))
        % loop through the remaining locations and check for the shortest
        % distance from the previous 
        
        if ~ismember(jj, bestOrder)
            tmpIdx = jj;
            tempDist = getLength(locations(bestOrder(end),:), locations(jj,:));
            
            if tempDist < bestDist
                bestDist = tempDist;
                bestIdx = tmpIdx;
            end
            
        end
        
    end
    
    totalLen = totalLen + bestDist;
    bestOrder(end+1) = bestIdx;
    
end

% add in the distance from last city to first
totalLen = totalLen + getLength(locations(end,:), locations(1,:)); 

bestOrder(end+1) = bestOrder(1);

