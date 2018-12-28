function [ parent, chosen ] = tournamentSelection( population, settings )
%TOURNAMENTSELECTION uses a tournament-style selection algorithm to choose
%a member of the population for mating. 

randMembers = randperm(settings.populationSize, settings.tournamentSize); 
randMembers = sort(randMembers);

% because the population is sorted by fitness (ascending order), the lowest
% index chosen by randperm will be the fittest member of the population. 
parent = population(randMembers(1), :);
chosen = randMembers(1);

end

