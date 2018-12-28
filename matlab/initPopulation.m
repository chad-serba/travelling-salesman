function [ startPop ] = initPopulation( settings )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if settings.nearestNeighborInit
    % use the nearest neighbor initialization. For each city in the list,
    % run the nearest neighbor alg to create the first population. Override
    % the population size to be the number of cities in the list
    if settings.populationSize < settings.numCities
        error('If using nearest neighbor init, must have a population greater than the number of cities')
    end
    
    startPop = zeros(settings.populationSize, settings.numCities+1);
    for jj = 1:settings.numCities
        startPop(jj,:) = nearestNeighborTS(jj, locs);
    end
    if settings.populationSize > settings.numCities
        startIdx = settings.numCities + 1;
        endIdx = settings.populationSize;
        startPop(startIdx:endIdx,1) = ones(endIdx - startIdx + 1, 1) * settings.startingCity;
        startPop(startIdx:endIdx,end) = ones(endIdx - startIdx + 1, 1) * settings.startingCity;
        for jj = startIdx:settings.populationSize
            startPop(jj,2:end-1) = randperm(settings.numCities - 1) + 1;
        end
    end
elseif settings.useSavedInitialPop
    % use a pre-determined population. Could be for evaluating different
    % combinations of settings effectiveness.
    tmp = load(settings.initialPop);
    startPop = tmp.tmpPop;
else
    startPop = zeros(settings.populationSize, settings.numCities+1);
    startPop(:,1) = ones(settings.populationSize, 1) * settings.startingCity;
    startPop(:,end) = ones(settings.populationSize, 1) * settings.startingCity;
    for jj = 1:settings.populationSize
        startPop(jj,2:end-1) = randperm(settings.numCities - 1) + 1;
    end
end


end

