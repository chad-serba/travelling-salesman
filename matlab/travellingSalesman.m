% travelling salesman script
%close all;
clc


sale.numCity = 60;
sale.mapSize = [200, 200];


%%%%%%%%%%%%
% STEP ONE %
%%%%%%%%%%%%
% generate random city locations
sale.cities = generateCities(sale.numCity, sale.mapSize);
% sale.cities = knownCities20;

%%%%%%%%%%%%%%
% STEP THREE %
%%%%%%%%%%%%%%
% determine best order of city travel
%[sale.bestOrder, sale.bestLen] = bruteForce(sale.numCity, sale.cities);
[sale.bestOrder, sale.bestLen, sale.info] = geneticSalesman(sale.numCity, sale.cities);

%%%%%%%%%%%%%
% STEP FOUR %
%%%%%%%%%%%%%
% plot the best route to take
plot_route(sale)

% plot the fitness trend
figure;
hold on
plot(sale.info.bestFitness)
title(sprintf('Best Length: %.1f',round(sale.info.bestFitness(end),1)))
fprintf('Shortest Len: %5.1f\n', min(sale.bestLen))
