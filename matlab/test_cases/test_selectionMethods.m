% test selection methods.
addpath('..\selectionAlgorithms')
addpath('..')

numRuns = 100000;
numCities = 50;

gen.settings.startingCity = 1; % choose which city you are starting in. 
gen.settings.numCities = numCities;
gen.settings.populationSize = 200;
gen.settings.maxGenerations = 1000;
gen.settings.eliteChildren = 1;
gen.settings.mutateProb = 0.2;
gen.settings.tournamentSize = 6; % number of candidates chosen at random, best candidate is a mating partner
gen.settings.nearestNeighborInit = 0; % initialize with the nearest neighbor algorithm
gen.settings.useSavedInitialPop = 0;
gen.settings.initialPop = 'initialPopulation.mat'; % path to a .mat file saved initial population


cityLocs = generateCities(numCities, [200 200]);
population = initPopulation(gen.settings);
[fitness, population] = evaluateFitness(population, cityLocs);


chosen = zeros(numRuns, 1);
for jj = 1:numRuns
    [ parent, chosen(jj) ] = rouletteSelection(population, fitness, gen.settings);
%     [ parent, chosen(jj) ] = tournamentSelection(population, gen.settings);
end

hist(chosen, 100)