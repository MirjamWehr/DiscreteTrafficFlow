function [ u ] = analyticalSolutionValue( t,ul,ur,H,x )
%analyticalSolutionValue calculates the value of the analytical solution of
%a given rieman problem at a certain time dt
%   t, scalar, the current time
%   ul, 2x1 vecctor, the left value
%   ur, 2x1 vector, the right value
%   H, scalar, function parameter
%   x, 1xN matrix, the x axes
%   u, 2xN matrix, the solution at time t

N = length(x);
u = zeros(2,N);

m = getM(H,ul,ur);

%check where we need rarefaction and where we need shock
%between ul an um
if ul(1) < m(1)
    %rarefaction between ul and um
    lambda1l = -H*ul(2)/(1-ul(1));
    lambda1m = -H*m(2)/(1-m(1));
    u = u + ul*(x<=lambda1l*t);
    u = u + m*((x>lambda1m*t)&(x<t));
    %connection from ul to um
    xil = - H*ul(2)/(1-ul(1));
    index = find((x>lambda1l*t)&(x<=lambda1m*t));
    u(1,index) = 1/t*x(index) - xil + ul(1);
    u(2,index) = (1-1/t*x(index)+xil-ul(1)).^H * ul(2)/((1-ul(1))^H);
else
    %shock between ul and um so lambda1(ul)>=lambda1(um)
    lambda1 = -H*m(2)/(1-m(1));
    u = u + ul*(x<=lambda1*t);
    u = u + m*((x>lambda1*t)&(x<t));
end
%not necessary for um and ur to compare since there is always a contact
%discontinuity
u = u + ur*(x>=t);



end

