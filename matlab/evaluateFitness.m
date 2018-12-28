function [ fitness, population ] = evaluateFitness( population,  locs)
%EVALUATEFITNESS determines the fitness for each member of the population,
%sorts them, and returns the population in order

fitness = zeros(length(population(:,1)), 1);
for ii = 1:length(population(:,1))
   
    order = population(ii, :);
    fitness(ii) = geneticFitness(order, locs); % determine the fitness for this member of the population
   
end

[fitness, population] = arrange_by_fitness(fitness, population);


end

