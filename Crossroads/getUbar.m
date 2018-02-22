function [u1,u2,u3] = getUbar(p1,q1,p2,q2,p3,q3)
%getUbar 
%   

if q1==0
    %if the values are admissible we know q2=0 and q3=0, that would mean
    %that nothing changes, if not we would subtract q2 and q3
    u1=[p1;0];
    u2=[p2-q2;0];
    u3=[p3-q3;0];
else
    %the upper bound for q1 respectively q2+q3
    upper_bound = q1/(q1-p1+1);
    u1=[1-(1-p1)/(1-p1+q1);upper_bound];
    u2=[upper_bound/2+p2-q2;upper_bound/2];
    u3=[upper_bound/2+p3-q3;upper_bound/2];
end

%theoretisch kann man beide fälle verbinden es gibt aber falls q1=0 und
%p1=1 ist ein problem, da upper_bound dann durch null teilt