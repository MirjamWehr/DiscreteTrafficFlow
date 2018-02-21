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

if isValid(phat1,qhat1,phat2,qhat2,phat3,qhat3)
    %get the value of the crossroads
    [ubar1,ubar2,ubar3] = getUbar(phat1,qhat1,phat2,qhat2,phat3,qhat3);

    %solve the PDE
else
    sprintf('The initial traffic on the roads does not fulfil the required conditions.')
end