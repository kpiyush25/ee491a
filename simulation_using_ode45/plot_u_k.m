function plot_u_k(t, dXdt, len, N)
    theta_dot = zeros(len, N);
    for i = 1:len
        for k = 1:N
            theta_dot(i, k) = dXdt(i, 3*(k-1)+1);
        end
    end

    for k = 1:N
        plot(t, theta_dot(:, k));
        hold on;
    end
    title('Plot of u_k vs time');
    xlabel('time (sec)');
    ylabel('u_k');
    legend('u_1','u_2','u_3','u_4','u_5','u_6');
end