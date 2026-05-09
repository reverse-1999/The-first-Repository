N = 1000;
E_theroy = 4/3;
Var_theroy = 2/9;
u = rand(N,1);
x = 2*sqrt(u);
E_sample = mean(x);
Var_sample = var(x);
disp(['期望误差：', num2str(abs(E_sample - E_theroy))]);
disp(['方差误差：', num2str(abs(Var_sample - Var_theroy))]);
%更换样本数量
N = 100;
u = rand(N,1);
x = 2*sqrt(u);
E_sample = mean(x);
Var_sample = var(x);
disp(['期望误差：', num2str(abs(E_sample - E_theroy))]);
disp(['方差误差：', num2str(abs(Var_sample - Var_theroy))]);
%绘制直方图和概率密度函数
figure(1);
subplot(1,2,1);
histogram(x, 'Normalization', 'pdf');
hold on;
f = @(x) (x/2).^2;
fplot(f, [0, 2], 'r-', 'LineWidth', 2);
title('样本分布与理论概率密度函数');
xlabel('x');
ylabel('概率密度');
subplot(1,2,2);
plot(x, zeros(size(x)), 'ro', 'MarkerFaceColor', 'r');
hold on;
fplot(f, [0, 2], 'b-', 'LineWidth', 2);
title('样本点与理论概率密度函数');
xlabel('x');
ylabel('概率密度');


