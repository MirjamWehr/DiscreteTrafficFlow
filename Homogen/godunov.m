H = 1;
%number of cells
N = 100;
a = 0;
b = 1;
dx = (b-a)/N;
t = 0;

x = (a+dx/2:dx:b-dx/2);

u0 = 1/4*ones(2,N);
u0(1,1:50) = 2*u0(1,1:50);



figure
plot_p = subplot(2,1,1);
plot(plot_p,x,u0(1,:),'x')
title(plot_p,{['Time ',num2str(t)];'Initial values for \rho'})
plot_q = subplot(2,1,2);
plot(plot_q,x,u0(2,:),'x');
title(plot_q,'Initial values for q')
axis([plot_p,plot_q],[a b 0 1.1])
pause

dt = get_dt(H,u0,dx);
u = godunovStep(u0,dt,dx,H);
for i = 1:2*N
    
    t = t+dt;
    plot_p = subplot(2,1,1);
    plot(plot_p,x,u(1,:),'x');
    title(['t = ',num2str(t)]);
    title(plot_p,{['Time ',num2str(t)];'Values for \rho'})
    plot_q = subplot(2,1,2);
    plot(plot_q,x,u(2,:),'x');
    title(plot_q,'Values for q')
    
    pause(dt);
    
    dt = get_dt(H,u,dx);
    u = godunovStep(u,dt,dx,H);
    
end
    
