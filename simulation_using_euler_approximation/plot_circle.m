function plot_circle(x_center, y_center, radius, unit_of_plot)
    theta = 0:pi/100:2*pi;
    x = x_center + radius*cos(theta);
    y = y_center + radius*sin(theta);
    plot(x, y, unit_of_plot);
    hold on;
end