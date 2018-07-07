err = zeros(2,4);
DX = zeros(1,4);

for i = 1:4
    H = 1;
    %number of cells
    N = 2*10^(i-1);
    a = -1;
    b = 1;
    dx = (b-a)/N;
    DX(i) = dx;
    t = 0;
    
    xrieman = (a+dx/2:dx:b-dx/2);

    ql = 0.5;
    qr = 0.3;
    pl = 0.7;
    pr = 0.3;
    u0 = ones(2,N);
    u0(1,1:N/2) = pl*u0(1,1:N/2);
    u0(2,1:N/2) = ql*u0(2,1:N/2);
    u0(1,N/2+1:N) = pr*u0(1,N/2+1:N);
    u0(2,N/2+1:N) = qr*u0(2,N/2+1:N);

    dt = get_dt(H,u0,dx);
    boundary_left = u0(:,1);
    boundary_right = u0(:,end);
    u = godunovStep(u0,dt,dx,H,boundary_left,boundary_right);
    while t<0.3
        t = t+dt;
        analyticalU = analyticalSolutionValue(t,[pl;ql],[pr;qr],H,xrieman);    
        dt = get_dt(H,u,dx);
        boundary_left = u(:,1);
        boundary_right = u(:,end);
        u = godunovStep(u,dt,dx,H,boundary_left,boundary_right);
    end
    err(:,i) = dx*sum(abs(u-analyticalU),2);
end
vgl = zeros(2,4);
for i=1:4
    vgl(:,i) = err(:,1)*2^(-i+1);
end

loglog(DX,err(1,:));
hold on
loglog(DX,err(2,:));
loglog(DX,vgl(1,:));
loglog(DX,vgl(2,:));
