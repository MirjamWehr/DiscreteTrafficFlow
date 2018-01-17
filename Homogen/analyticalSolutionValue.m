function [ u ] = analyticalSolutionValue( t,ul,ur,H,x )
%analyticalSolutionValue calculates the value of the analytical solution of
%a given rieman problem at a certain time dt
%   t, scalar, the current time
%   ul, 2x1 vecctor, the left value
%   ur, 2x1 vector, the right value
%   H, scalar, function parameter
%   x, 1xN matrix, the x axes
%   u, 2xN matrix, the solution at time t

m = getM(H,ul,ur);

%check where we need rarefaction and where we need shock
%between ul an um
if ul(1) < m(1)
    %rarefaction between ul and um
else
    %shock between ul and um - tritt nicht ein?
end
if m(1) < ur(1)
    %rarefaction between um and ur - tritt nicht ein?
else
    %shock between um and ur
end



end

