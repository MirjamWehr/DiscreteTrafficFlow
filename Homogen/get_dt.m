function [ dt ] = get_dt( H,u,dx )
%get_dt applies the CFL condition to the problem in order to get the steps
%in time
%   H, scalar >= 1, function parameter
%   u, 2xN matrix, the current solution
%   dx, scalar, the current step size in x-direction
%   dt scalar, fulfilling the CFL condition

%lambda1 is the first eigenvalue and always negative
lambda1 = -H*u(2,:)./(1-u(1,:)).^H;

%the second eigenvalue is 1 so compare the lambda1 with the highest absolut
%value to 1 and get the maximal speed
%the CFL-condition reads dt/dx*lambda_max < 1/2
dt = dx*1/(2*max(max(abs(lambda1)),1));

end

