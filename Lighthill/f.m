function [ y ] = f( p )
%f function in the Lighthill-Witham modell
%   p vector
%   y vector, function value of f at p

y = p.*(1-p);


end

