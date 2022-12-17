function plots(t, X, dXdt, len, omega_d_inv, M, N, c_d, t_end)
    figure(1);
    plot_trajectories(X, len, N);
    hold on
    plot_circle(0,0,5);
    hold on
%     plot_circle(0,0,10);
    theta = 0:pi/100:2*pi;
    delta = 5.5;
    x = 0 + (omega_d_inv+delta)*cos(theta);
    y = 0 + (omega_d_inv+delta)*sin(theta);
    plot(x, y ,'o');
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

end