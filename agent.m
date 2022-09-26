classdef agent
    properties
        x;
        y;
        r;
        theta;
        theta_dot;
%         u;
    end
    
    methods
%         function update(x, y, theta, theta_dot, u)
        function obj = agent(x, y, theta, theta_dot)
            obj.x = x;
            obj.y = y;
            obj.r = x + 1i*y;
            obj.theta = theta;
            obj.theta_dot = theta_dot;
%             obj.u = theta_dot;
        end
    end
end