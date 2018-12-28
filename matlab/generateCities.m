function [ cities ] = generateCities( num, mapSize )
%GENERATECITIES generates the random locations of cities for the travelling
%salesman problem

x = mapSize(1);
y = mapSize(2);
   
cities = [rngRand(-x, x, num, 1), rngRand(-y, y, num, 1)];

end

