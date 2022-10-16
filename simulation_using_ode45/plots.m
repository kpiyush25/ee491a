function plots(t, X, dXdt, len, omega_d_inv, M, N, c_d)
    figure(1);
    plot_trajectories(X, len, N);
    grid on
    axis equal;

    figure(2);
    plot_u_k(t, dXdt, len, N);
    grid on

    figure(3);
    plot_mod_e_k(t, X, len, N, omega_d_inv, c_d);
    grid on

    figure(4);
    plot_mod_p_m_theta(t, X, len, M, N);
    grid on
end