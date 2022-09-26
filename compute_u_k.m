function u_k = compute_u_k(omega_d, kappa, delta, c_d, K, M, r_k, theta_k, p_theta_t, e_k)
    u_k = omega_d + (kappa*real(conj(r_k - c_d)*exp((1i*theta_k))))/(omega_d*(delta^2 - (abs(e_k))^2));
    for m = 1:M
        u_k = u_k - K(m)*real(conj(p_theta_t(m))*1i*exp(1i*m*theta_k));
    end
end

