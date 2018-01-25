function [ y ] = f( u,H )
%f the function f of the problem dt v + f(v)dx v = 0, where v = (p,z)
%   u, 2xN matrix
%   H, scalar >= 1, function parameter
%   y, 2xN matrix, function value of f at u

f1 = u(2,:);
f2 = H.*u(2,:)./((1-u(1,:)).^H);

y = [f1;f2];

end

