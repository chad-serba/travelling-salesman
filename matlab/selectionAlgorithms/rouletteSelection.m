function [ parent, chosen ] = rouletteSelection( population, fitness, settings )
%ROULETTESELECTION uses the roulette wheel selection technique to choose a
%parent 
%   Detailed explanation goes here

fitnessSum = sum(fitness); % add up all the fitnesses

prob = zeros(length(fitness), 1); % initialize a zero vector
probSum = 0;
for ii = 1:length(population(:,1)) % for all the members of the population
    prob(ii) = probSum + fitness(ii) / fitnessSum;
    probSum = probSum + prob(ii);
end

randNum = rand;
for jj = 1:length(population(:,1))-1
    tmpProp = prob(jj) / probSum;
    if (randNum > tmpProp)% && (randNum < tmpProp)
        parent = population(jj,:);
        break;
    end
    
    if jj == length(population(:,1))-1
        parent = population(end,:);
        break;
    end
end

chosen = jj;
          
end

