function p_theta = compute_p_theta(N, errors)
    p_theta = exp(1i*errors(1));
    for i = 2:N
        p_theta = p_theta + exp(1i*errors(i));
    end
end