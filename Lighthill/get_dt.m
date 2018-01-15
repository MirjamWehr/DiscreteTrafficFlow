function [ dt ] = get_dt( p,dx )
%get_dt calculates the time step according to the CFL condition
%   p vector, values of p
%   dx scalar, cell size
%   dt scalar, time step

m = max(abs(df(p)));
dt = dx*1/(2*m);

end

