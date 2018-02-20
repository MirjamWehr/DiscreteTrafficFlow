function [ Lambda ] = augmentedLagrangian( x,y,r )
%augmentedLagrangian
%   

fi = F1(x);
p = length(fi);
fj = F2(x);
m = length(fj)+p;
sum1 = r/2*sum((positive(fi+y(1:p)/r)).^2);
sum2 = r/2*sum((fj+y(p+1:m)/r).^2);
sum3 = sum(y.^2)/(2*r);
Lambda = f(x)+sum1+sum2-sum3;


end

