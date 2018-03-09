function [ u ] = VtoU( v,H,index )
%VtoU converts the variable v=(p,z)  to u=(p,q)
%   v 2xN matrix
%   H scalar, function parameter
%   u 2xN matrix

u = zeros(size(v));
p = v(1,:);
z = v(2,:);
u(1,:)=p;
u(2,index)=z(index)*eps;
u(2,~index)=z(~index).*((1-p(~index)).^H)/H;
end