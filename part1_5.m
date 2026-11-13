data = readtable('lab5_nist_vtec.csv');
t = data.t_hr;
y = data.vtec;

idx = t >= 14 & t <= 18;
theta = sLin_Reg(t(idx), y(idx));
yhat = theta(1) + theta(2)*t;

r2_window = theta(3);
rmse_window = sqrt(mean((y(idx) - yhat(idx)).^2));

r2_day = 1 - sum((y - yhat).^2)/sum((y - mean(y)).^2);
rmse_day = sqrt(mean((y - yhat).^2));

fprintf('a0 = %.4f TECU\n', theta(1));
fprintf('a1 = %.4f TECU/hr\n', theta(2));
fprintf('Window:    r2 = %.4f, RMSE = %.4f TECU\n', r2_window, rmse_window);
fprintf('Whole day: r2 = %.4f, RMSE = %.4f TECU\n', r2_day, rmse_day);
%Chat helped with fprintf formatting

plot(t, y, '.', t, yhat, '-');
xlabel('Time (hr UTC)');
ylabel('VTEC (TECU)');
legend('Data', '14–18 UTC fit', 'Location', 'best');
xlim([0 24]);
grid on;