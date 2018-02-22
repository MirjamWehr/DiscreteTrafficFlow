function [ u_new ] = godunovStep( u_old,dt,dx,H,boundary_left,boundary_right)
%godunovStep uses the godunov state to get the new value for u
%   u_old 2xN matrix, the previous values of u
%   dt scalar, the time step according to the CFL condition
%   dx scalar, stepsize
%   H scalar, function parameter
%   u_new 2xN matrix, the new values of u
%   boundary_left
%   boundary_right

%preparing the left and right values
ul = circshift(u_old,1,2);
ul(:,1) = boundary_left;
ur = circshift(u_old,-1,2);
ur(:,end) = boundary_right;

%getting the godunov state
uml = getM(H,ul,u_old);
umr = getM(H,u_old,ur);

%converting the variables
vml = UtoV(uml,H);
vmr = UtoV(umr,H);
v_old = UtoV(u_old,H);

%calculating the new u
v_new = v_old - (dt/dx)*(f(vmr,H)-f(vml,H));

%converting the result
u_new = VtoU(v_new,H);

end

