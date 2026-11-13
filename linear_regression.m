function [a, r2] = linear_regression(x,y)
%{ Linear Regression curve fitting
% Produces least squares fit
% EQ: y_vec = a1*x + a0% 
% x = input variable
% y = input variable 
% a1 = slope 
% a0 = intercept
% r2 = coefficient of determination
% Note: x and y must be SAME length}

n = length(x);
x = x(:);
y = y(:);

sx = sum(x);
sy = sum(y);
sx2 = sum(x.*x);
sxy = sum(x.*y);
sy2 = sum(y.*y);

a(1) = ((n*sxy)-(sx*sy))/((n*sx2)-(sx^2));      %a1
a(2) = (sy/n)-a(1)*(sx/n);                      %a0
a=flip(a);                                      %[a1 a0] -> [a0 a1]
r2 = (((n*sxy)-(sx*sy))/sqrt((n*sx2)-(sx^2))/sqrt((n*sy2)-(sy^2)))^2;

end