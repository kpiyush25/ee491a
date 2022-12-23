function plots(t, X, dXdt, len, omega_d_inv, M, N, c_d, t_end, K, omega_d, p_theta, kappa, delta)
    figure(1);
    plot_trajectories(X, len, N);
    hold on
    plot_circle(real(c_d),imag(c_d), omega_d_inv + delta); 
    grid on
    axis equal;

    figure(2);
    plot_u_k(t, dXdt, len, N, t_end);
    grid on

    figure(3);
    plot_mod_e_k(t, X, len, N, omega_d_inv, c_d);
    grid on

    figure(4);
    plot_mod_p_m_theta(t, X, len, M, N);
    grid on

    figure(5);
    plot_v1_dot(t, len, N, dXdt, K, omega_d, p_theta, kappa, omega_d_inv, X, c_d);
    grid on

end