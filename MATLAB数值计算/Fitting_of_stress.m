x_origin = 1.1:10.1;%默认是一行储存
fprintf('%.1f ', x_origin');
fprintf('\n');
y_origin = [39.9 155.3 351.9 633.0 1001.0 1457.9 2005.4 2644.6 3377.0 4203.6];
fprintf('%.1f ', y_origin);
fprintf('\n');

x = log(x_origin);
y = log(y_origin);

fprintf('%.3f ', x);
fprintf('\n');
fprintf('%.2f ', y);
fprintf('\n');

%%%%%%%%% The first question %%%%%%%%%%
n=2;
C = zeros(n,n);
B = zeros(n,1);
for i=1:n
    for j=1:n
        C(i,j) = sum(x.^(i+j-2));
    end
end
disp(C);
for k=1:n
    B(k,1) = sum(y.*(x.^(k-1)));
end
%%%%%%%%% The second question %%%%%%%%%%
Coe = C\B;
disp(Coe);
A = exp(Coe(1,1));
Beta = Coe(2,1);
disp(A);
disp(Beta);
%%%%%%%%% The third question %%%%%%%%%%
e = sum((log(A) + Beta.*x - y).^2);
disp(e);
%%%%%%%%% The fourth question %%%%%%%%%%
Coe = sort(Coe,"ascend");
result0 = polyval(Coe,log(4.5));
result1 = log(A)+Beta*log(4.5);
result = exp(result0);
fprintf('%.1f MPa', result);
fprintf('\n');


