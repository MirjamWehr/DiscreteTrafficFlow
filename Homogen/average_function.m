function [ f ] = average_function( f0,a,b,dx )
%average_function averages the initial function an returns a step function
%   f0 function, the initial function to a problem
%   a,b scalar, the interval on which the problem is to solve
%   dx scalar, the cell size
%   f vector, contains the value of the stepfunction

k = ceil((b-a)/dx);
f = zeros(k,1);

for i=1:k
    f(i) = average_cell(f0,a+(i-1)*dx,min(i*dx,b));
end

end

