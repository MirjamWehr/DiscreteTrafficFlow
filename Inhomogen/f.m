function [ y ] = f( u,H )
%f the function f of the problem dt u + f(u)dx u = 0
%   u, 2xN matrix
%   H, scalar >= 1, function parameter
%   z, 2xN matrix, function value of f at u

p = u(2,:);
q = H.*u(2,:)./((1-u(1,:)).^H);

y = [p;q];

end

