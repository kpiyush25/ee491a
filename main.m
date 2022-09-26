clc; clear all; close all;
num_iterations = 2000;
M = 6; % M and N correspond to M-N phase patterns
N = 6;
delta = 5.5;
c_d = 0 + 1i*0; % c_d is the centre of the desired circle.

omega_d = 0.1;
rho_d = 1/omega_d; % rho_d is the radius of the desired circle.
kappa = 0.02;
K = zeros(1, 6);
for i = 1:5
    K(i) = 0.1;
end
K(6) = -0.05;

p_theta = zeros(1, M-1);

X_0 = [-1; 0.5; 2*sqrt(2); 5*sqrt(3); 15; 3*sqrt(3)];
Y_0 = [-3*sqrt(3); -15; -3*sqrt(2); 0; 0.5; 9];
Theta_0 = [-pi/6; pi/15; pi/4; pi/3; pi/2; 2*pi/3];
theta = zeros(num_iterations, N);
errors = zeros(num_iterations, N);
p_theta = zeros(num_iterations, M);
agents = zeros(num_iterations, N, 5);
for i = 1:N
    theta(1, i) = Theta_0(i);
end

for m = 1:M-1
    p_theta(1, m) = compute_p_m_theta(m, N, theta(1,:));
end
p_theta(1, M) = 1/M;
for k = 1:num_iterations
    for i =1:N
        agents(k, i, :) = create_agent(X_0(i), Y_0(i), Theta_0(i), 0);
    end
end
for i = 1:N
    errors(1, i) = (agents(1, i, 3) - c_d) + 1i*(1/omega_d)*exp(1i*agents(1,i,4));
    
    
end
for i = 1:N
    agents(1, i, 5) = compute_u_k(omega_d, kappa, delta, c_d, K, M, agents(1, i, 3), agents(1, i, 4), p_theta(1,:), errors(1,i));
    % fprintf("u_k for agent %d : %d\n",i, agents(1,i,5));
end

for k = 2:num_iterations
    for i = 1:N
        agents(k, i, 4) = agents(k-1,i,4) + agents(k-1,i, 5);
        % tsp = [0 600];
        % [t, agents(k, i, 4)] = ode45(@(t, agents(k, i, 4)), )
        agents(k, i, 3) = agents(k-1, i, 3) + exp(1i*agents(k-1, i, 4));
    end
    for i = 1:N
        errors(k, i) = (agents(k, i, 3) - c_d) + 1i*(1/omega_d)*exp(1i*agents(k,i,4));
    end
    for i = 1:M-1
        p_theta(k,i) = compute_p_m_theta(m, N, agents(k,:,4));
    end
    p_theta(k, M) = 1/M;
    for i = 1:N
        agents(k, i, 1) = real(agents(k, i, 3));
        agents(k, i, 2) = imag(agents(k, i, 3));
        errors(k, i) = (agents(k, i, 3) - c_d) + 1i*(1/omega_d)*exp(1i*agents(k,i,4));
        agents(k, i, 5) = compute_u_k(omega_d, kappa, delta, c_d, K, M, agents(k, i, 3), agents(k, i, 4), p_theta(k,:), errors(k,i));
%         fprintf("u_k for agent %d in iteration %d : %d\n",i,k, agents(k,i,5));
        disp(agents(k,i,5));
    end
end

mod_p_theta = zeros(num_iterations, M);
for i = 1:num_iterations
    for j = 1:M
        mod_p_theta(i, j) = abs(p_theta(i, j));
    end
end

mod_errors = zeros(num_iterations, N);
for i = 1:num_iterations
    for j = 1:N
        mod_errors(i, j) = abs(errors(i, j));
    end
end
plots(N, M, agents(:,:,:), mod_p_theta(:,:), mod_errors(:,:));
toc
    
    