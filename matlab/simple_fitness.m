function [ y ] = simple_fitness( x )
%SIMPLE_FITNESS Calculate the fitness value given x = [x1, x2, x3]
% want to minimize the function y

y = 55 * (x(1)^2 - x(2)^3) + (1 - x(2))^2;


end

