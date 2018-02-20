function [ L ] = GradientOfLagrangian( x,y )
%GradientOfLagrangian returns the value of the Gradient of the Lagrangian
%at point (x,y)
%   x 1x6 vector, where x=(q1,q2,q3,p1,p2,p3)
%   y 1x13 vector, an approximate local maximum for the dual problem
%   L 1x6 vector

global qhat1;
% global qhat2;
% global qhat3;
global phat1;
% global phat2;
% global phat3;

gf = -1*ones(1,6);
gF = [1 0 0 0 0 0 -1 0 0 1 0 0 0;
      0 1 0 0 0 0 0 -1 0 0 1 0 0;
      0 0 1 0 0 0 0 0 -1 0 0 1 0;
      -1 0 0 1 0 0 0 0 0 0 0 0 qhat1;
      0 -1 0 0 1 0 0 0 0 -1 -1 0 (1-phat1);
      0 0 -1 0 0 1 0 0 0 -1 0 -1 (1-phat1)];
L = gf + y*gF';


end

