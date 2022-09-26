function p_m_theta = compute_p_m_theta(m, N, theta)
    p_m_theta = 0;
    for k = 1:N
        p_m_theta = p_m_theta + exp(1i*m*theta(k));
    end
    p_m_theta = p_m_theta/(m*N);
end

