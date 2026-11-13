function theta = sLin_Reg(x, y)

%sLin_Reg: Outputs the parameters for a linear regression fit for any given dataset
%    theta = [a0, a1, r2]
    x = x(:);
    y = y(:);
    n = length(x);
    theta(1) = (sum(y) - a1*sum(x)) / n;
    theta(2) = (n*sum(x.*y) - sum(x)*sum(y))/(n*sum(x.^2) - sum(x)^2);


    xhat = linspace(0, n,n);
    yhat = theta(1) + theta(2)*xhat;

    sr = sum((yhat-y).^2);
    st = sum((y- mean(y)).^2);
    r2 = (st - sr) / st;
    theta(3) = r2;
end
