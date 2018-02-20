function [ y ] = F2( x )
%F2 containing the functions fj of the standard optimization problem with
%fj = 0
%   x 1x6 vector, where x=(q1,q2,q3,p1,p2,p3)
%   y 1x4 vector, for each fj

global qhat1;
global qhat2;
global qhat3;
global phat1;
global phat2;
global phat3;
n1 = 1-phat1;
d2 = qhat2-phat2;
d3 = qhat3-phat3;

q1=x(1);
q2=x(2);
q3=x(3);
p1=x(4);
p2=x(5);
p3=x(6);

y=zeros(1,4);
y(1) = q1-p2-p3-d2-d3;
y(2) = q2-p2-d2;
y(3) = q3-p3-d3;
y(4) = n1*q1+qhat1*p1-qhat1;
end

