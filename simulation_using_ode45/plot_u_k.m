function plot_u_k(t, dXdt, len, N, t_end)
    theta_dot = zeros(len, N);
    start_iteration = 0;
    start_time = 400;
    flag = 0;
    for i = 1:len
        for k = 1:N
            theta_dot(i, k) = dXdt(i, 3*(k-1)+1);
        end
        if flag == 0 && t(i) > start_time
            flag = 1;
            start_iteration = i;
        end
    end

    freq_u_k = zeros(len - start_iteration, N);
    for k = 1:N
        freq_u_k(:, k) = theta_dot(start_iteration + 1:len, k);
        plot(t, theta_dot(:, k));
        hold on;
    end
    title('Plot of u_k vs time');
    xlabel('time (sec)');
    ylabel('u_k');
    legend('u_1','u_2','u_3','u_4','u_5','u_6');

    for k = 1:N
        peaks = findpeaks(freq_u_k(:, k));
        info = ['Number of peaks in u_k for agent ', num2str(k), ' is: ', num2str(size(peaks, 1))];
        disp(info);
        freq = size(peaks, 1)/(t_end - start_time);
        freq_info = ['Frequency of u_k for agent ', num2str(k), ' is: ', num2str(freq)];
        disp(freq_info);
        peak_to_peak_amp = max(freq_u_k(:, k)) - min(freq_u_k(:, k))
        disp('-----------------------');
    end
end