t = 0:pi/100:2*pi;
x0 = 16.*(sin(t).^3);
y0 = 13.*cos(t)-5.*cos(2.*t)-2.*cos(3.*t)-cos(4.*t);
figure(1);
title("Heart Curve");
grid on;
plot(x0,y0);

figure(2);
x = 0:pi/100:2*pi;
y1 = exp(sin(x)+cos(2.*x));
y2 = exp(cos(x)-2.*sin(x));

semilogy(x,y1,'r-',x,y2,'b--');
legend('y1','y2','Location','northwest');
xlabel("x");
ylabel("log(y)");
grid on;






