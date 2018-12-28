function [ dist ] = getDist( x, y )
%GETDIST gets the distance between points x and y


dist = sqrt( (x(1) - y(1))^2 + (x(2) - y(2))^2 );

end

