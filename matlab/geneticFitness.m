function [ len ] = geneticFitness( order, locations )
%GENETICFITNESS Calculates the fitness of a travelling salesman solution
% inputs:   locations: The locations of the cities
%           order: The order of the indexes of the locations 

len = 0;

for jj = 1:length(locations)-1
   
    len = len + getLength(locations(order(jj),:), locations(order(jj+1),:));
    
end

len = len + getLength(locations(end,:), locations(1,:)); % add in the length from the last city to the first city

len = 1/len;

end

