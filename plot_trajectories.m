function plot_trajectories(agents, N,num_iterations)
    plot_circle(0, 0, 10, '-.'); % rho_d + delta = 15.5, (0,0) is the centre.
    plot_circle(0, 0, 2, "-");
    for i = 1:N
        plot(agents(1,i,1), agents(1,i,2), 'o');
        hold on;
    end
    for i = 1:N
        plot(agents(:,i,1), agents(:,i,2),'-');
        hold on;
    end
    for i=1:N
        plot(agents(num_iterations,i,1), agents(num_iterations,i,2),"diamond" );
        hold on;
    end
    title('Splay formation with BLF based control law');
    xlabel('X (m)');
    ylabel('Y (m)');
    legend('a_00','a_01','a_1','a_2','a_3','a_4','a_5','a_6');
end