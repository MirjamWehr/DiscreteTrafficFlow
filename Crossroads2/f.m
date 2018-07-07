function [ y ] = f( v,H )
%f the function f of the problem dt v + f(v)dx v = 0, where v = (p,z)
%   v, 2xN matrix
%   H, scalar >= 1, function parameter
%   y, 2xN matrix, function value of f at v

p = v(1,:);
z = v(2,:);
f1 = 1/H*(z.*(1-p).^H);
f2 = z;

y = [f1;f2];

end
