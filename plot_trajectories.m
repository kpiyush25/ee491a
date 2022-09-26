function plot_trajectories(agents, N)
    plot_circle(0, 0, 15.5, '-.'); % rho_d + delta = 15.5, (0,0) is the centre.
    for i = 1:N
        plot(agents(1,i,1), agents(1,i,2), 'o');
        hold on;
    end
    for i = 1:N
        plot(agents(:,i,1), agents(:,i,2));
        hold on;
    end
    title('Splay formation with BLF based control law');
    xlabel('X (m)');
    ylabel('Y (m)');
    legend('a_0','a_1','a_2','a_3','a_4','a_5','a_6');
end