function dXdt = integrating_function2(t, X)
    % Constants:
    omega_d = 0.2;
    omega_d_inv = 1/omega_d;
    kappa = 0.02;
    c_d = 0 + 1i*0;
    delta = 5;
    rad_inv = 1/(omega_d_inv + delta);
    K = zeros(6, 1);
    for i = 1:5
        K(i) = 0.1;
    end
    K(6) = -0.005;
    N = 6;
    M = 6;

    % Variables :
    p_theta = zeros(M, 1);
    for m = 1 : M-1
        for k = 1 : N
            p_theta(m,1) = p_theta(m,1) + exp(1i*m*X(3*(k-1)+1,1));
        end
        p_theta(m,1) = p_theta(m,1)/(m*N);
    end
    p_theta(M,1) = 1/M;

    dXdt = zeros(N*3,1);
    for k = 1:N
         e_k = X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d + 1i*(omega_d_inv+delta)*exp(1i*X(3*(k-1)+1, 1));

         % Error from center:
%          e_k = X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d;

         %  The code below is our proposition similar to equation (20) to solve the problem of the paper:
%         dXdt(3*(k-1)+1, 1) = omega_d + (2*(delta^2)*kappa*real(conj(X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d)*exp((1i*X(3*(k-1)+1, 1)))))/(omega_d*((delta^2 - (abs(e_k))^2)^2));

        % The code below is to avoid the inner circle:
%         dXdt(3*(k-1)+1, 1) = rad_inv + (2*(((abs(e_k))^4) - delta^4)*kappa*real(conj(X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d)*exp((1i*X(3*(k-1)+1, 1)))))/(omega_d*((abs(e_k))^4));
        

        dXdt(3*(k-1)+1, 1) = rad_inv + (kappa/omega_d)*real(conj(X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d)*exp(1i*X(3*(k-1)+1, 1)))/(delta^2 - (abs(e_k))^2);

        % Error from center:
%         dXdt(3*(k-1)+1, 1) = rad_inv + (4*delta*(omega_d_inv + 2*delta)*(abs(e_k)^2 - (omega_d_inv + delta)^2)*real(conj(X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d)*exp((1i*X(3*(k-1)+1, 1)))))/((abs(e_k)^3 - omega_d_inv^2));

        % For experimental barrier lyapunov functions
%         dXdt(3*(k-1)+1, 1) = omega_d + (2*((abs(e_k)^4) - delta^4)*kappa*real(conj(X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d)*exp((1i*X(3*(k-1)+1, 1)))))/(omega_d*((abs(e_k))^4));
%           dXdt(3*(k-1)+1, 1) = omega_d + (1*((abs(e_k)^2) - delta^2)*kappa*real(conj(X(3*(k-1)+2, 1) + 1i*X(3*k, 1) - c_d)*exp((1i*X(3*(k-1)+1, 1)))))/(omega_d*((abs(e_k))^3));


        for m = 1 : M
            dXdt(3*(k-1)+1, 1) = dXdt(3*(k-1)+1, 1) - K(m)*real(conj(p_theta(m,1))*1i*exp(1i*m*X(3*(k-1)+1, 1)));
        end

        dXdt(3*(k-1)+2, 1) = cos(X(3*(k-1)+1, 1));
        dXdt(3*(k-1)+3, 1) = sin(X(3*(k-1)+1, 1));
    end
end