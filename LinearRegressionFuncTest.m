clc;
clear;

tol = 1e-10;

% Test (a): Points exactly on a line
x = 0:4;
y = 2*x + 1;

theta = sLin_Reg(x, y);

expected = [1, 2, 1];
actual = theta;

disp('Test A:')
disp(actual)
disp(abs(actual - expected) < tol)

% Test (b): Points not on a line
x = [0, 1, 2, 3];
y = [1, 0, 3, 2];

theta1 = sLin_Reg(x, y);

% we use r^2 instead of r because it explains how much of the variation in y
% is explained by our regression model
expected = [0.6, 0.6, 0.36];
actual = theta1;

disp('Test B:')
disp(actual)
disp(abs(actual - expected) < tol)
