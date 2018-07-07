%simulate a crossroads with two incoming roads and one outgoing road
%to simplify: all roads have length one

%add folder for solving the pde
%UniPC
%addpath('/users/cip/users/wehr/Desktop/Masterarbeit/Matlab2/DiscreteTrafficFlow/Homogen');
%Laptop
addpath('/home/mirj/Schreibtisch/Masterarbeit/Matlab2/DiscreteTrafficFlow/Homogen');

%initilize roads
%the taylor parameter
H=1;
%number of grids points
N = 200;
%cell size
dx = 1/N;
%vector of cell centers
x = 0+1/2*dx:dx:1-1/2*dx;
%current traffic on the roads
%!!Important: the initial values always have to fulfil certain conditions!!
%For the corresponding q and p have tho hold 0<=q<=p<=1
phat1 = 0.7;
qhat1 = 0.5;
phat2 = 0;
qhat2 = 0;
phat3 = 0.3;
qhat3 = 0.3;
%initializing u
u1 = init_u(phat1,qhat1,N);
u2 = init_u(phat2,qhat2,N);
u3 = init_u(phat3,qhat3,N);

%plot the initial setting
figure

plot_u1 = subplot(2,2,1);
plot(plot_u1,x,u1(1,:),'-r');
hold on
plot(plot_u1,x,u1(2,:),'-b');
hold off
title(plot_u1,'Incoming Road 1');
xlabel(plot_u1,'x');
legend(plot_u1,'\rho_1','q_1','Orientation','horizontal');
plot_u2 = subplot(2,2,3);
plot(plot_u2,x,u2(1,:),'-r');
hold on
plot(plot_u2,x,u2(2,:),'-b');
hold off
title(plot_u2,'Incoming Road 2');
xlabel(plot_u2,'x');
legend(plot_u2,'\rho_2','q_2','Orientation','horizontal');
plot_u3 = subplot(2,2,[2,4]);
plot(plot_u3,x,u3(1,:),'-r');
hold on
plot(plot_u3,x,u3(2,:),'-b');
hold off
title(plot_u3,'Outgoing Road 3');
xlabel(plot_u3,'x');
legend(plot_u3,'\rho_3','q_3');
axis([plot_u1,plot_u2,plot_u3],[0 1 0 1]);
hold off
pause();


%get the value of the crossroads
[ubar1,ubar2,ubar3] = getUbar(phat1,qhat1,phat2,qhat2,phat3,qhat3);

%solve the PDE
t=0;
while t<0.5
    %get the next timestep
    %ubar beruecksichtigen
    dt1 = get_dt(H,[u1 ubar1],dx);
    dt2 = get_dt(H,[u2 ubar2],dx);
    dt3 = get_dt(H,[u3 ubar3],dx);
    dt = min([dt1,dt2,dt3]);
    if dt<eps
        f = msgbox('The largest absolute eigenvalue is infinity. Therefore dt=0 in order to fulfill the CFL condition.');
        pause(10)
        return
    end
    %solve the PDE for one timestep
    %use default boundary conditions with copied boundary in ghost cell
    u1 = godunovStep(u1,dt,dx,H,u1(:,1),ubar1);
    u2 = godunovStep(u2,dt,dx,H,u2(:,1),ubar2);
    u3 = godunovStep(u3,dt,dx,H,ubar3,u3(:,end));
    %use own boundary conditions for example cars comming in the first road
    %or a traffic jam at the end of one or both outgoing roads
%     u1 = godunovStep(u1,dt,dx,H,[max(u1(1,1),0.7);u1(2,1)],ubar1);
%     u2 = godunovStep(u2,dt,dx,H,ubar2,[max(0,u2(1,1)-0.7);min(u2(1,1),0.7)]);
%     u3 = godunovStep(u3,dt,dx,H,ubar3,[max(0,u3(1,1)-0.7);min(u3(1,1),0.7)]);
    %update the plots
    plot_u1 = subplot(2,2,1);
    plot(plot_u1,x,u1(1,:),'-r');
    hold on
    plot(plot_u1,x,u1(2,:),'-b');
    hold off
    title(plot_u1,{'Incoming Road 1';['Time t=',num2str(t)]});
    plot_u2 = subplot(2,2,3);
    plot(plot_u2,x,u2(1,:),'-r');
    hold on
    plot(plot_u2,x,u2(2,:),'-b');
    hold off
    title(plot_u2,{'Incoming Road 2';['Time t=',num2str(t)]});
    plot_u3 = subplot(2,2,[2,4]);
    plot(plot_u3,x,u3(1,:),'-r');
    hold on
    plot(plot_u3,x,u3(2,:),'-b');
    hold off
    title(plot_u3,{'Outgoing Road 3';['Time t=',num2str(t)]});
    axis([plot_u1,plot_u2,plot_u3],[0 1 0 1]);
    %prepare for new step
    t = t+dt;
    phat1 = u1(1,end);
    qhat1 = u1(2,end);
    phat2 = u2(1,end);
    qhat2 = u2(2,end);
    phat3 = u3(1,1);
    qhat3 = u3(2,1);
    [ubar1,ubar2,ubar3] = getUbar(phat1,qhat1,phat2,qhat2,phat3,qhat3);
    drawnow;
end