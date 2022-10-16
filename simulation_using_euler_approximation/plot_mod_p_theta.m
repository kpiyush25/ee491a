function plot_mod_p_theta(mod_p_theta, M, endpoint)
    time = linspace(0, endpoint, endpoint);
    for i = 1:M
        plot(time, mod_p_theta(1:endpoint,i));
        hold on;
    end  
    title('Plot of mod of p_{theta} vs number of iterations(time)');
    xlabel('Number of iterations');
    ylabel('|p_{theta}|');
    legend('|p_{1theta}|','|p_{2theta}|','|p_{3theta}|','|p_{4theta}|','|p_{5theta}|','|p_{6theta}|');
end