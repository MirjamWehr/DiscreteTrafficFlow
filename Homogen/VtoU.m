function [ u ] = VtoU( v,H )
%VtoU converts the variable v=(p,z)  to u=(p,q)
%   v 2xN matrix
%   H scalar, function parameter
%   u 2xN matrix

u = zeros(size(v));
p = v(1,:);
z = v(2,:);
u(1,:)=p;
pones = p==1;
u(2,:)=1/H*z.*(1-p).^H;
u(2,pones)=z(pones)*eps;
end