function u_k = compute_u_k(omega_d, kappa, delta, c_d, K, M, r_k, theta_k, p_theta_t, e_k)
% function u_k = compute_u_k(omega_d, kappa, delta, c_d, K, r_k, theta_k, errors, N, e_k)
    u_k = omega_d + (kappa*real(conj(r_k - c_d)*exp((1i*theta_k))))/(omega_d*(delta^2 - (abs(e_k))^2));
    for m = 1:M
        u_k = u_k - K(m)*real(conj(p_theta_t(m))*1i*exp(1i*m*theta_k));
    end
    % The above 4 lines of code is as per the control law(20) given in the paper.

    % The below 2 lines of code is as per the control law(5) given in the paper.

    % u_k = omega_d + (kappa*real(conj(r_k - c_d)*exp((1i*theta_k))))/(omega_d*((delta^2 - (abs(e_k))^2)));
    % u_k = u_k - K*real(conj(compute_p_theta(N, errors))*1i*exp(1i*theta_k));

    %  The code below is our proposition similar to equation (10):

    % u_k = omega_d + (2*(delta^2)*kappa*real(conj(r_k - c_d)*exp((1i*theta_k))))/(omega_d*((delta^2 - (abs(e_k))^2)^2));
    % u_k = u_k - K*real(conj(compute_p_theta(N, errors))*1i*exp(1i*theta_k));

    %  The code below is our proposition similar to equation (20):
    % u_k = omega_d + (2*(delta^2)*kappa*real(conj(r_k - c_d)*exp((1i*theta_k))))/(omega_d*((delta^2 - (abs(e_k))^2)^2));
    % for m = 1:M
    %     u_k = u_k - K(m)*real(conj(p_theta_t(m))*1i*exp(1i*m*theta_k));
    % end

    % The code below is to avoid the inner circle:
    % u_k = omega_d + (2*((abs(e_k)^4) - delta^4)*kappa*real(conj(r_k - c_d)*exp((1i*theta_k))))/(omega_d*((abs(e_k))^4));
    % for m = 1:M
    %     u_k = u_k - K(m)*real(conj(p_theta_t(m))*1i*exp(1i*m*theta_k));
    % end
end

