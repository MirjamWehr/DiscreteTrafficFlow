function [ ktPair ] = TestForKuhnTuckerPair( x,y )
%TestForKuhnTuckerPair returns true if (x,y) is a Kuhn Tucker pair, else
%the function returns false
%   x 1x6 vector, where x=(q1,q2,q3,p1,p2,p3) an approximate local minimum
%   y 1x13 vector, an approximate local maximum for the dual problem
%   ktPair boolean, true if (x,y) is a Kuhn Tucker pair, false if not

if GradientOfLagrangian(x,y) ~= zeros(1,6)
    ktPair = false;
elseif F1(x).*y(1:9) ~= zeros(1,9)
    ktPair = false;
elseif sum(F1(x)>0)>0
    ktPair = false;
elseif sum(y(1:9)<0)>0
    ktPair = false;
elseif F2(x) ~= zeros(1:4)
    ktPair = false;
else
    ktPair = true;
end

end

