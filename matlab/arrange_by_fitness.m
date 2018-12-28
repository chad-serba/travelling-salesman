function [ fitness, population ] = arrange_by_fitness( fitness, population )
% use insertion sort to arrange the population by fitness value

ii = 2;
while ii < length(fitness)+1

    jj = ii;
    while (jj > 1) && (fitness(jj-1) > fitness(jj))
        tmp = fitness(jj-1,:);
        fitness(jj-1,:) = fitness(jj,:);
        fitness(jj,:) = tmp;
        
        tmp2 = population(jj-1,:);
        population(jj-1,:) = population(jj,:);
        population(jj,:) = tmp2;
        
        jj = jj - 1;
    end
    ii = ii + 1;
end


end

