function [ bestOrder, bestLen ] = bruteForce( num, locs )

numVec = 1:1:num;
possibleCombos = perms(numVec);
[len, ~] = size(possibleCombos);


fprintf('Beginning brute force method...\n')
fprintf('%i possible routes\n', len)

startTime = cputime;
bestLen = realmax;
for ii = 1:len
    
    tmpOrder = possibleCombos(ii,:);
    tmpLen = 0;
    for jj = 1:length(tmpOrder)-1
       
        city1 = locs(tmpOrder(jj),:);
        city2 = locs(tmpOrder(jj+1),:);
        tmpLen = tmpLen + getDist(city1, city2);
        
    end
        
    if (tmpLen < bestLen)
        bestLen = tmpLen;
        bestOrder = tmpOrder;
    end
    
    
end
endTime = cputime;
totalTime = endTime - startTime;

fprintf('Done after %.2f seconds\n', totalTime)
fprintf('Shortest Route: %.2f\n', bestLen)

end

