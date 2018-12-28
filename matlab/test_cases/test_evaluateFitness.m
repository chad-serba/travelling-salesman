% script to evaluate the evaluateFitness.m algorithm


addpath('../')

cities = csvread('city_locations.txt');
tmp = csvread('random_orders.txt');

orders = tmp(:, 1:15);
fitnesses = tmp(:, 16);
correct_order = tmp(:, 17);

[correctFit, idx] = sort(fitnesses);
for jj = 1:length(correctFit)
    correctPop(jj,:) = orders(idx(jj),:);
end


[returnedFit, returnedPop] = evaluateFitness(orders, cities);

if ~nearlyEqual(returnedFit, correctFit)
    fprintf('Did not return the correct fitness order\n')
end

if returnedPop ~= correctPop
    fprintf('Did not return the correct population order\n')
end

