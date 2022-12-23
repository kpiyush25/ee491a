function plot_v1_dot(t, len, N, dXdt, K, omega_d, p_theta, kappa, omega_d_inv, X, c_d, delta)
    v1_dot = zeros(len, 1);
    for i = 1:len
        for k = 1:N
            e_k = X(i, 3*(k-1)+2) + 1i*X(i, 3*k) - c_d + 1i*omega_d_inv*exp(1i*X(i, 3*(k-1)+1));
            v1_dot(i, 1) = v1_dot(i, 1) - (omega_d - dXdt(i, 3*(k-1)+1))^2;
        end
    end

    plot(t, v1_dot);
    title('Plot of v1_{dot} vs time');
    xlabel('time (sec)');
    ylabel('v1_{dot}');

end

