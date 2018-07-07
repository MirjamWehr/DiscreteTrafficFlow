
H = 1;
%number of cells
N = 400;
a = -1;
b = 1;
dx = (b-a)/N;
t = 0;

x = (a+dx/2:dx:b-dx/2);
xrieman = x;

ql = 0.5;
qr = 0.3;
pl = 0.7;
pr = 0.3;
u0 = ones(2,N);
u0(1,1:200) = pl*u0(1,1:200);
u0(2,1:200) = ql*u0(2,1:200);
u0(1,201:N) = pr*u0(1,201:N);
u0(2,201:N) = qr*u0(2,201:N);

figure
plot_p = subplot(2,1,1);
plot(plot_p,x,u0(1,:),'-');
xlabel('x');
% ylabel('\rho');
hold on
plot(plot_p,x,u0(1,:),'-');
legend({'numerical Solution','analyticalSolution'},'Location','southwest');
legend('boxoff');
hold off
title(plot_p,{['Time ',num2str(t)];'Initial values for \rho'});
plot_q = subplot(2,1,2);
plot(plot_q,x,u0(2,:),'-');
xlabel('x');
% ylabel('q');
hold on
plot(plot_q,x,u0(2,:),'-');
legend({'numerical Solution','analyticalSolution'},'Location','southwest');
legend('boxoff');
title(plot_q,'Initial values for q');
axis([plot_p,plot_q],[a b 0 0.8]);
hold off
pause

dt = get_dt(H,u0,dx);
boundary_left = u0(:,1);
boundary_right = u0(:,end);
u = godunovStep(u0,dt,dx,H,boundary_left,boundary_right);
i=0;
while t<0.5
    i=i+1;
    t = t+dt;
    analyticalU = analyticalSolutionValue(t,[pl;ql],[pr;qr],H,xrieman);
    plot_p = subplot(2,1,1);
    plot(plot_p,x,u(1,:),'-');
    hold on
    plot(plot_p,x,analyticalU(1,:),'-');
    xlabel('x');
%     ylabel('\rho');
    legend({'numerical Solution','analyticalSolution'},'Location','southwest');
    legend('boxoff');
    hold off
    title(['t = ',num2str(t)]);
    title(plot_p,{['Time ',num2str(t)];'Values for \rho'})
    plot_q = subplot(2,1,2);
    plot(plot_q,x,u(2,:),'-');
    hold on
    plot(plot_q,x,analyticalU(2,:),'-');
    xlabel('x');
%     ylabel('q');
    legend({'numerical Solution','analyticalSolution'},'Location','southwest');
    legend('boxoff');
    hold off
    title(plot_q,'Values for q')
    axis([plot_p,plot_q],[a b 0 0.8])
    
    pause(dt/2);
    
    dt = get_dt(H,u,dx);
    boundary_left = u(:,1);
    boundary_right = u(:,end);
    u = godunovStep(u,dt,dx,H,boundary_left,boundary_right);
    
end
    
