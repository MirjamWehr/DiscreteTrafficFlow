function [u1,u2,u3] = getUbar(p1,q1,p2,q2,p3,q3)
%getUbar 
%   

if q1<=eps && q2<=eps
    u1=[p1;0];
    u2=[p2;0];
    u3=[p3-q3;0];
% elseif q1<=eps && q2>eps
%     u1=[p1;0];
%     p3n = max(p3-q3,min(1,q2/(1-p2+q2)-p3+q3));
%     u2=[1-(1-p2)/q2*(p3n-p3-q3);p3n-p3+q3];
%     u3=[p3n;p3n-p3+q3];
% elseif q1>eps && q2<=eps
%     u2=[p2;0];
%     p3n = max(p3-q3,min(1,q1/(1-p1+q1)-p3+q3));
%     u1=[1-(1-p1)/q1*(p3n-p3-q3);p3n-p3+q3];
%     u3=[p3n;p3n-p3+q3];
elseif q1<=eps && q2>eps
    u1=[p1;0];
    p2n = max(1-(1-p3+q3)*(1-p2)/q2,q2/(1-p2+q2));
    q2n = (1-p2n)/(1-p2)*q2;
    u2=[p2n;q2n];
    u3=[p3-q3+q2n;q2n];
elseif q1>eps && q2<=eps
    u2=[p2;0];
    p1n = max(1-(1-p3+q3)*(1-p1)/q1,q1/(1-p1+q1));
    q1n = (1-p1n)/(1-p1)*q1;
    u1=[p1n;q1n];
    u3=[p3-q3+q1n;q1n];
else
    bx = 1-p1;
    by = 1-p2;
    cx = q1/((bx)*(bx+q1));
    cy = q2/((by)*(by+q2));
    d = 1-p3+q3;
    if bx*cx+by*cy <= d
        x = 0;
        y = 0;
    else
    ax = bx-d/(2*cx);
    ay = by-d/(2*cy);
    if ax < ay
        if ax < 0
            x=0;
            d=d-bx*cx;
            y= max(0,by-d/(2*cy));
        else
            x=ax;
            y=ay;
        end
    else
        if ay < 0
            y=0;
            d=d-by*cy;
            x= max(0,bx-d/(2*cx));
        else
            x=ax;
            y=ay;
        end
    end
    end
    p1n=(q1+x)/(1-p1+q1);
    p2n=(q2+y)/(1-p2+q2);
    q1n=(1-p1n)*q1/(1-p1);
    q2n=(1-p2n)*q2/(1-p2);
    u1=[p1n;q1n];
    u2=[p2n;q2n];
    u3=[q1n+q2n+p3-q3;q1n+q2n];       
end
