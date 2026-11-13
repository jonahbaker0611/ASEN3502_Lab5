function theta = sLin_Reg(x, y)

%sLin_Reg: Outputs the parameters for a linear regression fit for any given dataset
%   theta = [a0, a1, r2]
%   Code assumes inputs are the same size
%   If y is const, then r2 will be undefined

    x = x(:);
    y = y(:);
    n = length(x);
    theta(2) = (n*sum(x.*y) - sum(x)*sum(y))/(n*sum(x.^2) - sum(x)^2);
    theta(1) = (sum(y) - theta(2)*sum(x)) / n;




    yhat = theta(1) + theta(2)*x;

    sr = sum((yhat-y).^2)
    st = sum((y- mean(y)).^2)
    r2 = (st - sr) / st

    theta(3) = r2;
end
