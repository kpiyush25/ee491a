function plots(N, M, agents, mod_p_theta, mod_errors)
    % ek iteration ka kitna sec hua?
    figure(1);
    plot_trajectories(agents, N)

    figure(2);
    plot_mod_p_theta(mod_p_theta, M);

    figure(3);
    plot_mod_e_k(mod_errors, N);
    
    figure(4)
    plot_u_k(agents, N);
end