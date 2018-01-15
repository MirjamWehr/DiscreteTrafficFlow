function [ y ] = average_cell( f0,a,b )
%average_cell averages the value of the function over the cell given by a
%and b
%   f0 function, the function which need to be averaged
%   a,b scalar, the cell over which the average is calculated
%   y scalar, the average value

sum = 0;
delta = (b-a)/100;
for i = 1:101
    sum = sum + f0(a+(i-1)*delta);
end
y = sum/101;

end

