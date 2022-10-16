function plots(N, M, endpoint, agents, mod_p_theta, mod_errors,num_iterations)
    % ek iteration ka kitna sec hua?
    figure(1);
    plot_trajectories(agents, N,num_iterations)
    grid on
    axis equal;

    figure(2);
    plot_mod_p_theta(mod_p_theta, M, endpoint);
    grid on

    figure(3);
    plot_mod_e_k(mod_errors, N, endpoint);
    grid on
    
    figure(4)
    plot_u_k(agents, N, endpoint);
    grid on
end