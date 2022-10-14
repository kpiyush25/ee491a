function plot_u_k(agents, N, endpoint)
    time = linspace(0, endpoint, endpoint);
    for i = 1:N
        plot(time, agents(1:endpoint,i,5));
        hold on;
    end 
    title('Plot of u_k vs number of iterations(time)');
    xlabel('Number of iterations(time)');
    ylabel('u_k');
    legend('u_1','u_2','u_3','u_4','u_5','u_6');
end