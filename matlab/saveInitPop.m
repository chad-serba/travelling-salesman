function [  ] = saveInitPop( settings )
%SAVEINITPOP Creates an initial population and saves it for later, to be
%read in through a *.mat file

tmpPop = zeros(settings.populationSize, settings.numCities+1);
tmpPop(:,1) = ones(settings.populationSize, 1) * settings.startingCity;
tmpPop(:,end) = ones(settings.populationSize, 1) * settings.startingCity;
for jj = 1:settings.populationSize
    tmpPop(jj,2:end-1) = randperm(settings.numCities - 1) + 1;
end

save('initialPopulation.mat', 'tmpPop');

end

