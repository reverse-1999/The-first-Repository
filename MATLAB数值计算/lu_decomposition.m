    % 输入: 
    % A = n×n矩阵
    % 输出: 
    % L = 下三角矩阵
    % U = 上三角矩阵
function [L, U] = lu_decomposition(A)
    n = size(A,1);
    L = eye(n);
    U(1,1:n) = A(1,1:end);
    for j = 1:n-1 %
        for i = j+1:n % 算L第i行j列
            L(i,j) = A(i,j);
            for r = 1:j-1
                L(i,j) = L(i,j)- L(i,r)*U(r,j);
            end
            L(i,j) = L(i,j)/U(j,j);
        end
        for k = j+1:n
            U(j+1,k) = A(j+1,k);
            for r = 1:j
                U(j+1,k) = U(j+1,k)-L(j+1,r)*U(r,k);
            end
            U(j+1,k) = U(j+1,k)/L(j+1,j+1);
        end
    end
end