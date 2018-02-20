%Penalty Multiplier

%init
r = 1; % has to be greater 0
m = 13; %number of equations
y = zeros(1,m);
ktPair =  false;
k = 0;

while (k<50 & ~ktPair)
    %TODO compute local minimum x(k) of the lagrangian
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