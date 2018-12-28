function [ len ] = getLength(loc1, loc2)
% Get the length between two locations 

len = sqrt((loc1(1) - loc2(1))^2 + (loc1(2) - loc2(2))^2);

end
