function [zero] = equalsZero(x,tol)
  
  compvec = ones(size(x))*tol;
  result = -compvec <= x <= compvec;
  zero = (sum(result)==0);
  
end

