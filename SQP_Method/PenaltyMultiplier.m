%Penalty Multiplier

%set the problem
global qhat1;
global qhat2;
global qhat3;
global phat1;
global phat2;
global phat3;

qhat1 = 1/4;
qhat2 = 1/16;
qhat3 = 1/16;
phat1 = 1/2;
phat2 = 1/16;
phat3 = 1/16;

%init
r = 1; % has to be greater 0
m = 13; %number of equations
y = zeros(1,m);
y(1,10:m) = ones(1,4);
ktPair =  false;
k = 0;
x0 = findValidx0();

while (k<3000 && ~ktPair)
    auglagrangian = @(x)augmentedLagrangian(x,y,r);
    x = fminsearch(auglagrangian,x0);
    x0 = x;
    ktPair = TestForKuhnTuckerPair(x,y);
    if ~ktPair
        fi = F1(x);
        p = length(fi);
        y(1:p) = r*positive(fi+y(1:p)/r);
        fj = F2(x);
        y(p+1:m) = r*(fj+y(p+1:m)/r);
    end
    k=k+1;
end

