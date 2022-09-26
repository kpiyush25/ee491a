clc; clear all; close all;
num_iterations = 100;
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

% system_model = system_model();
X_0 = [-1; 0.5; 2*sqrt(2); 5*sqrt(3); 15; 3*sqrt(3)];
Y_0 = [-3*sqrt(3); -15; -3*sqrt(2); 0; 0.5; 9];
Theta_0 = [-pi/6; 0; pi/4; pi/3; pi/2; 2*pi/3];
theta = zeros(num_iterations, N);
errors = zeros(num_iterations, N);
p_theta = zeros(num_iterations, M);
for i = 1:N
    theta(1, i) = Theta_0(i);
end

for m = 1:M-1
    p_theta(1, m) = compute_p_m_theta(m, N, theta(1,:));
end
p_theta(1, M) = 1/M;
for i =1:N
    agents(1, i) = agent(X_0(i), Y_0(i), Theta_0(i), 0);
end
for i = 1:N
    errors(1, i) = (agents(1, i).r - c_d) + 1i*(1/omega_d)*exp(1i*agents(1,i).theta);
end
for i = 1:N
    agents(1, i).theta_dot = compute_u_k(omega_d, kappa, delta, c_d, K, M, agents(1, i).r, agents(1, i).theta, p_theta(1,:), errors(1,i));
end
disp(agents(1,1).theta);
disp(agents(1,1).theta_dot);
agent(1,1) = agent(0,0,0,0);
for k = 2:num_iterations
    for i = 1:N
%         agents(k, i) = agent(agents(k-1,i).x, agents(k-1,i).y, agents(k-1,i).theta + agents(k-1,i).theta_dot, 0);
        agents(k, i) = agent(0,0,0,0);
    end
    for i = 1:M-1
        p_theta(k,i) = compute_p_m_theta(m, N, agents(k,:).theta);
    end
    p_theta(k, M) = 1/M;
    for i = 1:N
        %update x, y, r here:
        agents(k, i).r = agents(k-1, i).r + exp(1i*agents(k, i).theta);
        agents(k, i).x = real(agents(k, i).r);
        agents(k, i).y = imag(agents(k, i).r);
        errors(k, i) = (agents(k, i).r - c_d) + 1i*(1/omega_d)*exp(1i*agents(k,i).theta);
        agents(k, i).theta_dot = compute_u_k(omega_d, kappa, delta, c_d, K, M, agents(k, i).r, agents(k, i).theta, p_theta(k), errors(k));
    end
end

for i = 1:N
%     disp(agents(i, 1).x);
%     disp(agents(i, 1).y);
end

plot(agents(1).x, agents(1).y); 
    
    
    