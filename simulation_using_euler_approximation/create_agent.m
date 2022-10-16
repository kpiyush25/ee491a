function agent = create_agent(x, y, theta, theta_dot)
    agent(1) = x;
    agent(2) = y;
    agent(3) = x + 1i*y;
    agent(4) = theta;
    agent(5) = theta_dot;
end