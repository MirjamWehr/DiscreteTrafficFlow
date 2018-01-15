function [ FG ] = getFG( u,v )
%getFG evaluates the the Godunov Fluxfunction
%   u vector, left values of p
%   v vector, right values of p
%   FG vector, function value of f at the godunov state

maxvalues = u <= v;
minvalues = u > v;
interval = ((u<=1/2) & (1/2<=v));
FG = max(f(u),f(v)).*minvalues+(interval*f(1/2)+~interval.*min(f(u),f(v))).*maxvalues;
        
end

