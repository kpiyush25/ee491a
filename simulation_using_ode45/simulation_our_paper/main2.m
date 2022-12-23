clc; clear all; close all;
tic;
N = 6;
M = 6;
omega_d = 0.2;
omega_d_inv = 1/omega_d;
c_d = 0 + 1i*0;

kappa = 0.002;
delta = 0.7;
rad_inv = 1/(omega_d_inv + delta);
K = zeros(6, 1);
for i = 1:5
    K(i) = 0.01;
end
K(6) = -0.5;
%
% X_0 = [-1; 0.5; 2*sqrt(2); 5*sqrt(3); 15; 3*sqrt(3)];
% Y_0 = [-3*sqrt(3); -14; -3*sqrt(2); 0; 0.5; 9];
% Theta_0 = [-pi/6; 0; pi/4; pi/3; pi/2; 2*pi/3];

% X_0 = [-1; 2*sqrt(2); 2*sqrt(2); 2*sqrt(2); 2*sqrt(2); 2*sqrt(2)];
% Y_0 = [-3*sqrt(3); -3*sqrt(2); -3*sqrt(2); -3*sqrt(2); -3*sqrt(2); -3*sqrt(2)];
% Theta_0 = [-pi/6; pi/4; pi/4; pi/4; pi/4; pi/4];

X_0 = [-12; 11.5; 7*sqrt(2); 15*sqrt(3); 8; 13*sqrt(3)];
Y_0 = [-8*sqrt(3); -12; -13*sqrt(2); 15; 10.5; 9];
Theta_0 = [-pi/6; 0; pi/4; pi/3; pi/2; 2*pi/3];

% X_0 = [-12; 11.5; 7*sqrt(2); 15*sqrt(3); 8; 13*sqrt(3); 10; 12];
% Y_0 = [-8*sqrt(3); -12; -13*sqrt(2); 15; 10.5; 9; 10.5; 11];
% Theta_0 = [-pi/6; 0; pi/4; pi/3; pi/2; 2*pi/3; 3*pi/4; 4*pi/5];
t_start = 0;
t_end = 4000;
tspan = [t_start t_end]

X_init = zeros(N*3,1);
for k = 1:N
    X_init((k-1)*3 + 1, 1) = Theta_0(k);
    X_init((k-1)*3 + 2, 1) = X_0(k);
    X_init((k-1)*3 + 3, 1) = Y_0(k);
end

options=odeset('RelTol',1e-4,'AbsTol',1e-4);
[t, X] = ode45(@integrating_function2, tspan, X_init, options);

size(X)
len = size(X, 1)
dXdt = zeros(len, 3*N);
for i = 1 : len
    dXdt(i, :) = integrating_function2(t(i), X(i, :)');
    % X(i, :) contains theta, x and y of the agents at ith time while 
    % dXdt(i, :) contains theta_dot, x_dot and y_dot of the agents at ith time.
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


plots(t, X, dXdt, len, omega_d_inv, M, N, c_d, t_end, K, rad_inv, p_theta, kappa, delta);

toc