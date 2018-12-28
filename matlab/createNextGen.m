function [ newPopulation ] = createNextGen( population, fitness, settings )
%CREATENEXTGEN determines the next generation from a population. Assumes 
%that the population is ordered in terms of increasing route length (lowest fitness to largest) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine the elite children %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% based on the settings
elitePop = population(1:settings.eliteChildren, :);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do some mating, AND ALLOW FOR RANDOM MUTATION %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% we are using the tournament selection algorithm. This takes a sample of
% random members of the population, and uses the best member as the mate. 

for ii = 1:settings.populationSize - settings.eliteChildren
   
    parent1 = tournamentSelection(population, settings);
    parent2 = tournamentSelection(population, settings);
%     parent1 = rouletteSelection(population, fitness, settings);
%     parent2 = rouletteSelection(population, fitness, settings);
    
    tmpChild = orderedCrossover(parent1, parent2);
    %children(ii,:) = swapMutation(tmpChild, settings);
    children(ii,:) = reverseSequenceMutate(tmpChild, settings);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FORM THE NEW POPULATION %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
newPopulation(1:settings.eliteChildren, :) = elitePop;
newPopulation(settings.eliteChildren+1:settings.populationSize,:) = children;


