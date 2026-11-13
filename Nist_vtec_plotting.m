%Nist_vtec plotting
figure;
plot(nist_vtec.t_hr,nist_vtec.vtec)
xline(14,Color='r')
xline(18,Color='r')
ylabel('VTEC');
xlabel('Time (hours)');
grid on;
title('VTEC Variation Over Time');