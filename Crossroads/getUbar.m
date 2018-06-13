function [u1,u2,u3] = getUbar(p1,q1,p2,q2,p3,q3)
%getUbar 
%   

if q1<=eps
    %if the values are admissible we know q2=0 and q3=0, that would mean
    %that nothing changes, if not we would subtract q2 and q3
    u1=[p1;0];
    u2=[p2-q2;0];
    u3=[p3-q3;0];
else
    %the upper bound for q1 respectively q2+q3
    d2 = p2-q2;
    d3 = p3-q3;
    %Setting1 Cars spread evenly
%     x = min([1-d2,1-d3,q1/(2*(q1-p1+1))]);
%     u1=[1-2*x*((1-p1)/q1);2*x];
%     u2=[d2+x;x];
%     u3=[d3+x;x];
    %Setting2 1.max flux 2.spread evenly
%     x = min(1-d2,q1/(2*(q1-p1+1)));
%     y = min(1-d3,q1/(2*(q1-p1+1)));
%     u1=[1-(x+y)*(1-p1/q1);2*x];
%     u2=[d2+x;x];
%     u3=[d3+y;y];
    %Algorithm
    ax = 1-d2;
    ay = 1-d3;
    c = q1/(q1-p1+1);
    if ax < ay
        if ax < c/2
            x=ax;
            c=c-ax;
            y= min(c,ay);
        else
            x=c/2;
            y=c/2;
        end
    else
        if ay < c/2
            y=ay;
            c=c-ay;
            x=min(c,ax);
        else
            x=c/2;
            y=c/2;
        end
    end
    u1=[1-(x+y)*(1-p1/q1);2*x];
    u2=[d2+x;x];
    u3=[d3+y;y];       
end
