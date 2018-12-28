% script to use the genetic algorithm to find the minimum of a function
clc; close all; clear all;


maxGenerations = 100;
popSize = 10;
mutationFactor = 1;


gen = struct;

% elite children: 2
% crossover children: 5
% mutation children: 3

%%%%%%%%%%%%
% STEP ONE %
%%%%%%%%%%%%
% set up initial population
for ii = 1:popSize
       
    population(ii,:) = rngRand(-250, 250, 1, 2);   
    
end



itr = 1;
while itr < maxGenerations
    
    %%%%%%%%%%%%
    % STEP TWO %
    %%%%%%%%%%%%
    % evaluate fitness function for current population
    for ii = 1:popSize

        fitness(ii) = simple_fitness(population(ii,:));    

    end
    
    
    %%%%%%%%%%%%%%
    % STEP THREE %
    %%%%%%%%%%%%%%
    % reorder population based on fitness 
    fitTemp = fitness;
    popTemp = population;
    n = popSize;
    sorted = 0;
    kk = 0;
    while ~sorted
        sorted = 1; % could be sorted
        kk = kk+1;    % count passes
        for jj = 1:n-kk
            if fitTemp(jj) < fitTemp(jj+1)
                tmpFit = fitTemp(jj);
                fitTemp(jj) = fitTemp(jj+1);
                fitTemp(jj+1) = tmpFit;
                
                tmpPop = popTemp(jj,:);
                popTemp(jj,:) = popTemp(jj+1,:);
                popTemp(jj+1,:) = tmpPop;
                
                sorted = 0; % a swap was made
            end
        end
        
    end
    gen.arrangedFitness{itr} = fitTemp;
    gen.meanFitness(itr) = mean(fitTemp); 
    gen.stdDev(itr) = std(fitTemp);
    gen.arrangedPopulation{itr} = popTemp;
    

    %%%%%%%%%%%%%
    % STEP FOUR %
    %%%%%%%%%%%%%
    % Decide Children
    % first, the elite children
    gen.population{itr+1,1} = popTemp(1,:);
    gen.population{itr+1,2} = popTemp(2,:);
    
    % next, the crossover children
    parentVec = [3 4 5 6 7];
    for jj = 3:7
        parent1 = popTemp(randi([parentVec(1), parentVec(2)]),:);
        parent2 = popTemp(randi([parentVec(1), parentVec(2)]),:);
        parentsVec = [parent1 parent2];
        gen.population{itr+1,jj} = [parentsVec(randi(4,1)), parentsVec(randi(4,1))];
    end
    
    % finally, the mutation children. The mutation ammount increases as the
    % fitness for each child gets worse
    gen.population{itr+1,8} = popTemp(8,:) + mutationFactor*rngRand(-10, 10, 1, 2);
    gen.population{itr+1,9} = popTemp(9,:) + mutationFactor*rngRand(-10, 10, 1, 2);
    gen.population{itr+1,10} = popTemp(10,:) + mutationFactor*rngRand(-10, 10, 1, 2);
    
    for ii = 1:popSize
        population(ii,:) = gen.population{itr+1,ii};
    end
    
    % incrase the iteration counter
    itr = itr + 1;

end


%% Generate Plots

% generation 1
figure;
hold on
title('Generation 1')
for jj = 1:popSize
    
    x = gen.population{2,jj};
    plot(x(1), x(2), '*k')

end


% generation 10
figure
hold on
title('Generation 10')
for jj = 1:popSize
    
    x = gen.population{11,jj};
    plot(x(1), x(2), '*k')
    
end


% generation 25
figure
hold on
title('Generation 25')
for jj = 1:popSize
    
    x = gen.population{26,jj};
    plot(x(1), x(2), '*k')
    
end


% generation 50
figure
hold on
title('Generation 50')
for jj = 1:popSize
    
    x = gen.population{51,jj};
    plot(x(1), x(2), '*k')
    
end


% generation 99
figure
hold on
title('Generation 99')
for jj = 1:popSize
    
    x = gen.population{100,jj};
    plot(x(1), x(2), '*k')
    
end


%% Create animation of population locations
figure;
hold on
%an = animatedline;
for ii = 2:maxGenerations
    
    for jj = 1:popSize

        x = gen.population{ii,jj};
        plot(x(1), x(2), '*k');
        %addpoints(an,x(1),x(2));
    end
    drawnow
    pause(0.1)
    %clearpoints(an);
    
    
end
