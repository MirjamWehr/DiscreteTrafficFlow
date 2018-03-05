function [ v ] = UtoV( u,H )
%UtoV converts the variable u=(p,q)  to v=(p,z)
%   u 2xN matrix
%   H scalar, function parameter
%   v 2xN matrix

v = zeros(size(u));
p = u(1,:);
q = u(2,:);
v(1,:)=p;
pmod = p + eps.*(p==1);
v(2,:)=H*q./((1-pmod).^H);

end

