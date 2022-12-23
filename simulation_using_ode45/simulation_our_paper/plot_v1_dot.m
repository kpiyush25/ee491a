function plot_v1_dot(t, len, N, dXdt, K, rad_inv, p_theta, kappa, omega_d_inv, X, c_d, delta)
    v1_dot = zeros(len, 1);
    for i = 1:len
        for k = 1:N
            e_k = X(i, 3*(k-1)+2) + 1i*X(i, 3*k) - c_d;
            v1_dot(i, 1) = v1_dot(i, 1) + dXdt(i, 3*(k-1)+1) - rad_inv + K(k)*(1+dXdt(i, 3*(k-1)+1))*real(conj(p_theta(i, k))*1i*exp(1i*k*X(i, 3*(k-1)+1)));
            v1_dot(i, 1) = v1_dot(i, 1) + 4*kappa*((abs(e_k)^2 - (omega_d_inv+delta)^2)^2)*real(conj(X(i, 3*(k-1)+2) + 1i*X(i, 3*k) - c_d)*exp((1i*X(i, 3*(k-1)+1))))/(abs(e_k)^2 - omega_d_inv^2);
        end
    end

    plot(t, v1_dot);
    title('Plot of v1_{dot} vs time');
    xlabel('time (sec)');
    ylabel('v1_{dot}');

end

