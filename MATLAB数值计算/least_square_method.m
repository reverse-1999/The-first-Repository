% input: x,y为序列长度相等的数据向量
%        m = 拟合多项式次数
% output:P = 拟合多项式系数
function P=Polynomial(x,y,m)  
[m0,n0]=size(x);

n = m;
Z = zeros(n+1,n+1);
B = zeros(n+1,1);
for i=1:n0
    for p=1:n+1
        for q=1:n+1
           if p==1 && q==1
            Z(p,q) = Z(p,q) + 1;
           else
            Z(p,q) = Z(p,q)+x(i).^(p+q-2);
           end
        end
    end
    B(1,1) = B(1,1)+y(i); 
    for o=2:n+1
        B(o,1) = B(o,1)+y(i).*x(i).^(o-1); 
    end
end%生成正则方程组Z和右边项B
Result = Z\B;
P = Result';

end
x=[-2 -1 0 1 2];
y=[-0.1 0.1 0.4 0.9 1.6];
p1=Polynomial(x,y,2);
p2=Polynomial(x,y,3);

disp(p1);
disp(p2);

p3=polyfit(x,y,2); %内置函数快速计算系数，降序排序 
p4=polyfit(x,y,3);

disp(p3);
disp(p4);

for k=-2:2
    f=polyval(p3,k);%内置函数快速代入计算拟合值
    disp(f);
end









