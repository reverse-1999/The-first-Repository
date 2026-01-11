x = -5:0.2:5;
y = -5:0.2:5;
[X,Y] = meshgrid(x,y);
Z = sin(sqrt(X.*X + Y.*Y)).*cos(X);
subplot(2,1,1);
surf(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');
subplot(2,1,2);
contour(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');




















