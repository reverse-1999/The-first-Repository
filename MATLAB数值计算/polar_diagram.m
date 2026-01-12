theta = linspace(0,2*pi,1000);
r = 1-cos(theta);
r2 = 1-sin(theta);
polarplot(theta,r,'b-','LineWidth',1);
hold on;
polarplot(theta,r2,'g-','LineWidth',1);

text(pi/3, -1.5, '\leftarrow1-cos(\theta)');
text(-pi/3, 1, '1-sin(\theta)\rightarrow');

r_min = min(r, r2); 
X = r_min .* cos(theta);  
Y = r_min .* sin(theta);  

axes('Position', [0.05, 0.05, 0.2, 0.2]);
scatter(X, Y, 'r');  
xlim([-2, 1]); 
ylim([-2, 1]);  
grid on;       
box on;        
xlabel('x');    
ylabel('y');
















