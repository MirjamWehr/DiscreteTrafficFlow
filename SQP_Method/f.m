function [ y ] = f( x )
%f function to minimize
%   x 1x6 vector, where x=(q1,q2,q3,p1,p2,p3)
%   y scalar

q1=x(1);
q2=x(2);
q3=x(3);
p1=x(4);
p2=x(5);
p3=x(6);

y = -(q1+q2+q3+p1+p2+p3);

end
