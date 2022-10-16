clc; clear all; close all;
tic;
N = 6;
M = 6;
omega_d = 0.1;
omega_d_inv = 1/omega_d;
c_d = 0 + 1i*0;

X_0 = [-1; 0.5; 2*sqrt(2); 5*sqrt(3); 15; 3*sqrt(3)];
Y_0 = [-3*sqrt(3); -14; -3*sqrt(2); 0; 0.5; 9];
Theta_0 = [-pi/6; 0; pi/4; pi/3; pi/2; 2*pi/3];

t_start = 0;
t_end = 600;
% tspan = [t_start : 0.1 : t_end];
tspan = [t_start t_end]

X_init = zeros(N*3,1);
for k = 1:N
    X_init((k-1)*3 + 1, 1) = Theta_0(k);
    X_init((k-1)*3 + 2, 1) = X_0(k);
    X_init((k-1)*3 + 3, 1) = Y_0(k);
end

[t, X] = ode45(@integrating_function, tspan, X_init);
size(X)
len = size(X, 1)
dXdt = zeros(len, 3*N);
for i = 1 : len
    dXdt(i, :) = integrating_function(t(i), X(i, :)');
end

plots(t, X, dXdt, len, omega_d_inv, M, N, c_d);

toc