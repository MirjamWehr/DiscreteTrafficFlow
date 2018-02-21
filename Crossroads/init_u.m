function [u] = init_u(p,q,N)
  u = ones(2,N);
  u(1,:) = u(1,:)*p;
  u(2,:) = u(2,:)*q;
end

