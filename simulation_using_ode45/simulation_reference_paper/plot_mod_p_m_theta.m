function plot_mod_p_m_theta(t, X, len, M, N)
    mod_p_m_theta = zeros(len, M);

    for i = 1:len
        for m = 1:M-1
            for k = 1:N
                mod_p_m_theta(i, m) = mod_p_m_theta(i, m) + exp(1i*m*X(i, 3*(k-1)+1));
            end
            mod_p_m_theta(i, m) = abs(mod_p_m_theta(i, m)/(m*N));
        end
        mod_p_m_theta(i, M) = 1/M;
    end

    for m = 1:M
        plot(t, mod_p_m_theta(:, m));
        hold on;
    end
    title('Plot of mod of p_{theta} vs time');
    xlabel('time (sec)');
    ylabel('|p_{theta}|');
    legend('|p_{1theta}|','|p_{2theta}|','|p_{3theta}|','|p_{4theta}|','|p_{5theta}|','|p_{6theta}|');
end    
