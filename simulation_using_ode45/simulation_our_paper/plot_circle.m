function plot_circle(x_center, y_center, radius)
    theta = 0:pi/100:2*pi;
    x = x_center + radius*cos(theta);
    y = y_center + radius*sin(theta);
    plot(x, y ,'Linewidth',2);
    hold on;
end