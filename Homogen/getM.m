function [ m ] = getM( H,ul,ur)
%getM calculates the godunov state of a rieman problem
%   H, scalar >= 1, function parameter
%   ul, 2xN matrix, contains the current solution on the left side of
%       x_(i+1/2)
%   ur, 2xN matrix, contains the current solution on the right side of
%       x_(i+1/2)
%   m, 2xN matrix, contains the godunov states for each cell

%initialization
mi = ones(size(ul));

for i=1:length(ul(1,:))
    %initialization in current cell
    pl = ul(1,i);
    pr = ur(1,i);
    ql = ul(2,i);
    qr = ur(2,i);
    
    %calculate the intersection point of the two Lax-curves
    %L1: q=ql/((1-pl)^H)*(1-p)^H
    %L2-: q = p-pr+qr
    if pl == 1
        p = 1;
    else
        p = fzero(@(x) x-ql/((1-pl)^H)*(1-x)^H-pr+qr,pl+(pr-pl)/2);
    end
    q = p-pr+qr;
    
    %the godunov state is always this intersection state, since lamda1 is
    %always negativ and lamda2 always positiv
    mi(:,i) = [p;q];
end
m = mi;
end

