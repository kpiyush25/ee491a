function plot_mod_e_k(t, X, len, N, omega_d_inv, c_d)
    mod_e_k = zeros(len, N);
    for i = 1:len
        for k = 1:N
            mod_e_k(i, k) = abs(X(i, 3*(k-1)+2) + 1i*X(i, 3*k) - c_d + 1i*omega_d_inv*exp(1i*X(i, 3*(k-1)+1)));
        end
    end

    for k = 1:N
        plot(t, mod_e_k(:, k));
        hold on;
    end
    title('Plot of mod of e_k vs time');
    xlabel('time (sec)');
    ylabel('|e_k|');
    legend('|e_1|','|e_2|','|e_3|','|e_4|','|e_5|','|e_6|');
end

