N = 100;
a = 0;
b = 1;
dx = (b-a)/N;
t = 0;

x = (a+dx/2:dx:b-dx/2);

p0 = 0.3*ones(1,N);
p0(10:15) = 1/2*p0(10:15);

figure
plot(x,p0,'x')
title({['Time ',num2str(t)];'Initial values for \rho'})
axis([a b 0 1.1])
pause

dt = get_dt(p0,dx);
p = godunovStep(p0,dt,dx);
for i = 1:2*N
    
    t = t+dt;
    plot(x,p,'x');
    title({['Time ',num2str(t)];'Values for \rho'})
    axis([a b 0 0.5])
    pause(dt);
    
    dt = get_dt(p,dx);
    p = godunovStep(p,dt,dx);
    
end