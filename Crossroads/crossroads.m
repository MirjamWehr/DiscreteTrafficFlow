%simulate a crossroads with one incoming road and two outgoing roads
%to simplify: all roads have length one

%initilize roads
%number of grids points
N = 100;
%cell size
dx = 1/N;
%vector of cell centers
x = 0+1/2*dx:dx:1-1/2*dx;
%current traffic on the roads
%!!Important: the initial values always have to fulfil certain conditions!!
phat1 = 1/2;
qhat1 = 1/2;
phat2 = 0.625;
qhat2 = 1/4;
phat3 = 0.375;
qhat3 = 1/4;
%initializing u
u1 = init_u(phat1,qhat1,N);
u2 = init_u(phat2,qhat2,N);
u3 = init_u(phat3,qhat3,N);

%plot the initial setting
figure
plot_u1 = subplot(2,2,[1,3]);
plot(plot_u1,x,u1(1,:),'-r');
hold on
plot(plot_u1,x,u1(2,:),'-b');
hold off
title(plot_u1,'Incoming Road 1');
xlabel(plot_u1,'x');
legend(plot_u1,'\rho_1','q_1');
plot_u2 = subplot(2,2,2);
plot(plot_u2,x,u2(1,:),'-r');
hold on
plot(plot_u2,x,u2(2,:),'-b');
hold off
title(plot_u2,'Outgoing Road 2');
xlabel(plot_u2,'x');
legend(plot_u2,'\rho_2','q_2','Orientation','horizontal');
plot_u3 = subplot(2,2,4);
plot(plot_u3,x,u3(1,:),'-r');
hold on
plot(plot_u3,x,u3(2,:),'-b');
hold off
title(plot_u3,'Outgoing Road 3');
xlabel(plot_u3,'x');
legend(plot_u3,'\rho_3','q_3','Orientation','horizontal');
axis([plot_u1,plot_u2,plot_u3],[0 1 0 1]);

if isValid(phat1,qhat1,phat2,qhat2,phat3,qhat3)
    %get the value of the crossroads
    [ubar1,ubar2,ubar3] = getUbar(phat1,qhat1,phat2,qhat2,phat3,qhat3);

    %solve the PDE
else
    sprintf('The initial traffic on the roads does not fulfil the required conditions.')
end