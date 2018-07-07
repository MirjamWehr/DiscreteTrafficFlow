function [valid] = isValid(p1,q1,p2,q2,p3,q3)
%isValid 
%   
valid = ((q1==q2+q3)&&(q2>=0)&&(q3>=0)&&(p1>=q1)&&(p2>=q2)&&(p3>=q3)&&(p1<=1)&&(p2<=1)&&(p3<=1));
end

