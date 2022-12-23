function plot_trajectories(X, len, N)
    x_agents = zeros(len, N); % x_agents(i, j) means x of jth agent in ith iteration
    y_agents = zeros(len, N);

    for i = 1 : len
        for k = 1 : N
            x_agents(i, k) = X(i, 3*(k-1) + 2);
            y_agents(i, k) = X(i, 3*k);
        end
    end

    figure(1);
    for k = 1:N
        plot(x_agents(:, k), y_agents(:, k),':');
        hold on;
    end
    title('Splay formation with BLF based control law');
    xlabel('X (m)');
    ylabel('Y (m)');
    for k = 1:N
        plot(x_agents(len, k), y_agents(len, k), 'diamond');
        hold on;
    end
end