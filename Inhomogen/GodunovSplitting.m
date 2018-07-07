%GodunovSplitting for the system: 
%   dtP + 1/H*dx((1-P)^H*Z) = 0
%   dtZ + dxZ               = -1/epsilon(Z-H*F(P)/((1-P)^H))
%the PDE is solved with GodunovScheme
%   dtP + dxQ                           = 0
%   dtQ + HQ/(1-P)dxP + (1-HQ/(1-P))dxQ = 0
%for the ODE we take the resulting Q to get Z
%   Z = HQ/((1-P)^H)
%the ODE:
%   dtP = 0
%   dtZ = -1/epsilon*(Z-H*F(P)/((1-P)^H))
%We have to distinguish two cases
%epsilon=0:
%   Z = H*F(p)/((1-p)^H)
%for epsilon > 0 we can solve the ODE and get
%   Z(t) = exp(-dt/epsilon)(Z0 + epsilon*C*exp(dt/epsilon)-epsilon*C)
%with C = H*F(P)/(epsilon*(1-P)^H)

%Setting the model-parameters
%H >= 1, shouldn't be choosen to large since it's the distance in the 
%Taylor approximation
H = 1;
%for epsilon->0 the model should behave like the LWR-model, epsilon is
%allowed to be zero
epsilon = 0.1;

%Setting the parameters for the numerical method
%number of cells
N = 400;
%the intervall
a = -1;
b = 1;
%cell size
dx = (b-a)/N;
%cell vector
x = (a+dx/2:dx:b-dx/2);

%Set the initial values
u0 = ones(2,N);
u0(1,1:floor(N/2)) = 0.7*ones(1,floor(N/2));
u0(1,floor(N/2)+1:N) = 0.3*ones(1,N-floor(N/2));
u0(2,1:floor(N/2)) = 0.5*ones(1,floor(N/2));
u0(2,floor(N/2)+1:N) = 0.3*ones(1,N-floor(N/2));

t = 0;

%Plot the initial data
figure
%plot for p
plot_p = subplot(2,1,1);
plot(plot_p,x,u0(1,:),'-')
title(plot_p,{['Time ',num2str(t)];'Initial values for \rho'})
%plot for q
plot_q = subplot(2,1,2);
plot(plot_q,x,u0(2,:),'-');
title(plot_q,'Initial values for q')
%since the values for q and p are between zero and one we can fix the axes
axis([plot_p,plot_q],[a b 0 0.8])
pause
i=0;

u = u0;
while t <0.5
    i = i+1;
    %solving the homogenous PDE
    dt = get_dt(H,u,dx);
    u_star = godunovStep(u,dt,dx,H);
    t = t+dt;
    
    %solving the inhomogenous ODE 
    p = u_star(1,:);
    q_star = u_star(2,:);
    C = H*p./((1-p).^(H-1));
    z0 = H*q_star./((1-p).^H);
    if epsilon == 0 
        z = H*C;
    else
        z = exp(-1/epsilon*dt).*(z0 + C.*exp(1/epsilon*dt) - C);
    end
    q = 1/H*(1-p).^H.*z;
    t = t + dt;
    
    %putting together the solution
    u = [p;q];
    
    %plot the solution at the current time
    plot_p = subplot(2,1,1);
    plot(plot_p,x,u(1,:),'-');
    title(plot_p,{['Time ',num2str(t)];'Values for \rho'})
    plot_q = subplot(2,1,2);
    plot(plot_q,x,u(2,:),'-');
    title(plot_q,'Values for q')
    axis([plot_p,plot_q],[a b 0 0.8])
    pause(2*dt);
    
end
    
