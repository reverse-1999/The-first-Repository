    % 输入:
    % A = 系数矩阵	
    % b = 右侧常数列向量
    % 输出
    % x = 解向量
function x = myGaussPivot(A,b)  
    Z = [A b];
    [n,m] = size(Z);
    for j=1:n
        max = 0; 
        for i=j:n
            if abs(Z(i,j))>max
                max=abs(Z(i,j));
                maxi = i;
            end
        end
        t = Z(j,[1:end]);
        Z(j,[1:end])=Z(maxi,[1:end]);
        Z(maxi,[1:end])=t;
        
        for i=j+1:n
            Z(i,[1:end])=Z(i,[1:end]).* (Z(i-1,j)/Z(i,j));
        end
        for i=j+1:n
            Z(i,[1:end])=Z(i,[1:end])-Z(j,[1:end]);
        end
    end
    A = Z([1:n],[1:m-1]);
    b = Z([1:n],m);
    for i=n:-1:1
        x(i) = b(i);
        for j=n:-1:i+1
            x(i) = x(i)-A(i,j)*x(j);
        end
        x(i) = x(i)/A(i,i);
    end
    x=x';
end