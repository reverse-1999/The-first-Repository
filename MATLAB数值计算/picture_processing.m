A = [3 1 -8;1 -2 14;-5 1 2];
B = [-370;1210;-290];
%%%%%%%%% The first question %%%%%%%%%
[L,U] = Lu_decomposition(A);
disp(L);
disp(U);
Y = L \ B;
X = U \ Y;
disp(X);
%%%%%%%%% The second question %%%%%%%%%
x0 = 1:1500;
u0 = X(2,1);

o0 = sqrt(X(1,1));
o0 = 90;
y0 = Gaussian1(x0,u0,o0);

y0 = min(y0,3*10^-3);
y1 = y0./max(y0);
figure(1);
plot(x0,y1,'-b');



function [y]=Gaussian1(x0,u0,o0)
    y = 1/(sqrt(2*pi)*o0).*exp(-(x0-u0).^2/(2*o0^2));
end
%%%%%%%%% The third question %%%%%%%%%

%%%%%%%%% The fourth question %%%%%%%%%
img1 = imread("D:\Desktop\企业微信文件\1.png");
img2 = imread("D:\Desktop\企业微信文件\2.png");
figure(1);
imshow(img1);
d_img1 = im2double(img1);
d_img2 = im2double(img2);
disp(size(img1));

a = 0.2163;
b = -650.7729;

[M,N,channels] = size(img1);

imgfinal = zeros(M,N,3);
for i = 1:M
    for j = 1:N
        d = ceil(abs(j*a+i+b)./sqrt(a^2+1));
        imgfinal(i,j,:) = y0(d).*img1(i,j,:)+(1-y0(d))*img2(i,j,:);
    end
end
figure(2);
imshow(imgfinal);

function [L, U] = Lu_decomposition(A)
    n = size(A,1);
    L = eye(n);
    U = zeros(n,n);
    U(1,:) = A(1,:);%初始化
    L(2:n,1) = A(2:n,1)./U(1,1);
    for r=2:n
        for i=r:n %U
            U_sum = 0;
            for k1=1:r-1 %U sum
                U_sum = U_sum + L(r,k1)*U(k1,i);
            end
           U(r,i) = A(r,i) - U_sum;
        end
        for j=r+1:n %L
            L_sum = 0;
            for k2=1:r-1 %L sum
                L_sum = L_sum + L(j,k2)*U(k2,r);
            end
            L(j,r) = (A(j,r) - L_sum)/U(r,r);
        end
    end
end
