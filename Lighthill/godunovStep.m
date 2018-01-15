function [ p_new ] = godunovStep(p_old,dt,dx)
%godunovStep performes the godunov Step to get the new values for p
%   p_old vector, actual values of p
%   dt scalar, step size in time
%   dx scalar, cell size
%   p_new vector, new value for p

%preparing the left and right values
pl = circshift(p_old,1,2);
pl(1) = pl(2);
pr = circshift(p_old,-1,2);
pr(end) = pr(end-1);

%getting the godunov state
pml = getFG(pl,p_old);
pmr = getFG(p_old,pr);

%calculating the new p
p_new = p_old - (dt/dx)*(f(pmr)-f(pml));
end

