function theta = sLin_Reg(x, y)

%sLin_Reg: Outputs the parameters for a linear regression fit for any given dataset
%    theta = [a0, a1]
    x = x(:);
    y = y(:);
    n = length(x);
    theta(1) = (sum(y) - a1*sum(x)) / n;
    theta(2) = (n*sum(x.*y) - sum(x)*sum(y))/(n*sum(x.^2) - sum(x)^2);
end