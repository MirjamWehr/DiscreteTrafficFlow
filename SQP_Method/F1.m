function [ y ] = F1( x )
%F1 containing the functions fi of the standard optimization problem with
%fi <= 0
%   x 1x6 vector, where x=(q1,q2,q3,p1,p2,p3)
%   y 1x9 vector, for each fi

q1=x(1);
q2=x(2);
q3=x(3);
p1=x(4);
p2=x(5);
p3=x(6);

y=zeros(1,9);
y(1) = q1-p1;
y(2) = q2-p2;
y(3) = q3-p3;
y(4) = p1-1;
y(5) = p2-1;
y(6) = p3-1;
y(7) = -q1;
y(8) = -q2;
y(9) = -q3;

end

