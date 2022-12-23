clc; clear all; close all;
tic;
N = 6;
M = 6;
omega_d = 0.1;
omega_d_inv = 1/omega_d;
c_d = 0 + 1i*0;
delta = 5.5;
rad_inv = omega_d;
kappa = 0.02;
K = zeros(6, 1);
for i = 1:5
    K(i) = 0.1;
end
K(6) = -0.005; % Chattering in u_k and e_k reduces to very great extent on changing it from -0.05 to -0.005


X_0 = [-1; 0.5; 2*sqrt(2); 5*sqrt(3); 15; 3*sqrt(3)];
Y_0 = [-3*sqrt(3); -15; -3*sqrt(2); 0; 0.5; 9];
Theta_0 = [-pi/6; 0; pi/4; pi/3; pi/2; 2*pi/3];

t_start = 0;
t_end = 4000;
% tspan = [t_start : 0.1 : t_end];
tspan = [t_start t_end]

X_init = zeros(N*3,1);
for k = 1:N
    X_init((k-1)*3 + 1, 1) = Theta_0(k);
    X_init((k-1)*3 + 2, 1) = X_0(k);
    X_init((k-1)*3 + 3, 1) = Y_0(k);
end

options=odeset('RelTol',1e-3, 'AbsTol',1e-4);
[t, X] = ode45(@integrating_function, tspan, X_init, options);
% [t, X] = ode45(@integrating_function, tspan, X_init);
size(X)
len = size(X, 1)
dXdt = zeros(len, 3*N);
for i = 1 : len
    dXdt(i, :) = integrating_function(t(i), X(i, :)');
end

p_theta = zeros(len, M);

for i = 1:len
    for m = 1 : M-1
        for k = 1 : N
            p_theta(i, m) = p_theta(i,m) + exp(1i*m*X(i, 3*(k-1)+1));
        end
        p_theta(i, m) = p_theta(i, m)/(m*N);
    end
    p_theta(i, M) = 1/M;
end



plots(t, X, dXdt, len, omega_d_inv, M, N, c_d, t_end, K, omega_d, p_theta, kappa, delta);


toc