%1.7 plotting

load("lab5_nist_vtec.mat")
t_hr = nist_vtec.t_hr;
vtec = nist_vtec.vtec;
el_deg=10:90;
t_span = (t_hr >= 14) & (t_hr <= 18);

[a,r2]=linear_regression(t_hr(t_span),vtec(t_span));

times=[14,16,18];
vtec_fit=a(1)+a(2)*times;

figure;
hold on;

for k = 1:length(times)
    I = iono_delay(el_deg, vtec_fit(k));
    plot(el_deg, I, 'LineWidth', 1.5);
end

xlabel('Elevation Angle (degrees)');
ylabel('Ionospheric Delay (m)');
title('Ionospheric Delay vs Elevation Angle');
legend('14:00 UTC', '16:00 UTC', '18:00 UTC');
grid on;
hold off;