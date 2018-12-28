function [  ] = checkSettings( settings )
%CHECKSETTINGS makes sure there are no errors in your settings

if mod(settings.populationSize * settings.percentToReplace, 1)
    % the multiplication must not be an integer. 
    error('PercentToReplace must be set so that populationSize * percentToReplace is an integer')
end

end

