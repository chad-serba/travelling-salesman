function [ bestOrder, bestFitness, gen ] = geneticSalesman( num, locs )
%GENETICSALESMAN uses a genetic alg to solve the travelling salesman
%problem. 

% num: the number of cities on the map
% locs: the location of the cities on the map (same order as num)

addpath('mutationAlgorithms');
addpath('selectionAlgorithms');

%%%%%%%%%%%%%%%%%%%%%
% DEFINE PARAMETERS %
%%%%%%%%%%%%%%%%%%%%%
gen.settings.startingCity = 1; % choose which city you are starting in. 
gen.settings.numCities = num;
gen.settings.populationSize = 200;
gen.settings.maxGenerations = 1000;
gen.settings.eliteChildren = 2;
gen.settings.mutateProb = 0.2;
gen.settings.tournamentSize = 3; % number of candidates chosen at random, best candidate is a mating partner
gen.settings.nearestNeighborInit = 0; % initialize with the nearest neighbor algorithm
gen.settings.useSavedInitialPop = 0;
gen.settings.initialPop = 'initialPopulation.mat'; % path to a .mat file saved initial population

% checkSettings(gen.settings);

%%%%%%%%%%
% STEP 1 %
%%%%%%%%%%
% create first population
gen.population{1} = initPopulation(gen.settings);

jj = 1;
gen.bestFitness(1) = realmax;
while jj < gen.settings.maxGenerations + 1
   
    if ~mod(jj, 50)
        fprintf('Current Itr: %d, Shortest Length: %f\n', jj, gen.bestFitness(end))
    end
   
    %%%%%%%%%%
    % STEP 2 %
    %%%%%%%%%%
    % determine fitness of current population
    [gen.fitness{jj}, tmpPop] = evaluateFitness(gen.population{jj}, locs);
    
    %%%%%%%%%%
    % STEP 3 %
    %%%%%%%%%%
    % record the best fitness and corresponding order\
    [gen.bestFitness(jj), idx] = min(gen.fitness{jj});
    gen.bestOrder{jj} = tmpPop(idx,:);
    
    %%%%%%%%%%
    % STEP 4 %
    %%%%%%%%%%
    % determine next generation with elite children, swap mutations, and
    % cross breeding
    gen.population{jj+1} = createNextGen(tmpPop, gen.fitness{jj}, gen.settings);
     
    jj = jj + 1;
    
end

bestOrder = gen.bestOrder;
bestFitness = gen.bestFitness;
gen.numItr = jj;

save('gen.mat', 'gen')

end

