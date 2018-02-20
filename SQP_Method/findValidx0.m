function [x0] = findValidx0()

  global qhat1;
  global qhat2;
  global qhat3;
  global phat1;
  global phat2;
  global phat3;
  
  u2 = phat2-qhat2;
  u3 = phat3-qhat3;
  if (u2 == 1 || u3 == 1)
      if (qhat1==0)
          x0 = [0;0;0;0;u2;u3];
      else
          x0 = [0;0;0;1;u2;u3];
      end          
  else
      og2 = 1;
      og3 = 1;
      while (((og2-u2)/2+(og3-u3)/2) > (qhat1/(qhat1-phat1+1)))
          og2 = u2 + (og2-u2)/2;
          og3 = u3 + (og3-u3)/2;
      end
      x4 = -(og3+og2)*((1-phat1)/qhat1)+1+(-u2-u3)*((1-phat1)/qhat1);
      x0 = [og2+og3-u2-u3;og2-u2;og3-u3;x4;og2;og3];
  end
end

