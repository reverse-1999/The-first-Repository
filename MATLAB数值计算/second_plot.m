x = linspace(-2,4,1000);
y = 3.*x-2;
x1 = x(y<0);
y1 = y(y<0);
x2 = x(y>=0);
y2 = y(y>=0);

plot(x1,y1,'b--','LineWidth',2);
hold on;
plot(x2,y2,'r-','LineWidth',2);
title("Graph of y = 3x - 2");
xlabel('x');
ylabel('y');
legend('y<0','y≥0','Location','best');
hold off;

grid on;

















