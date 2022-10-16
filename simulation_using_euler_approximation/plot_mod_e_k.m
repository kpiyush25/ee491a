function plot_mod_e_k(mod_errors, N, endpoint)
    time = linspace(0, endpoint, endpoint);
    for i = 1:N
        plot(time, mod_errors(1:endpoint,i));
        hold on;
    end 
    % plot(time, mod_errors(1:endpoint, 2));
    % hold on;
    title('Plot of mod of e_k vs number of iterations(time)');
    xlabel('Number of iterations');
    ylabel('|e_k|');
    legend('|e_1|','|e_2|','|e_3|','|e_4|','|e_5|','|e_6|');
end