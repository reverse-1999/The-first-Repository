%% 图像边缘检测完整代码
% 功能：导入自定义图片 → 预处理 → Canny边缘检测 → 显示/保存边缘图
% 作者：MATLAB编程助手
% 适用版本：R2018b及以上（需安装Image Processing Toolbox）

%% ===================== 1. 配置参数（只需修改这部分！）=====================
imgPath = 'D:\Desktop\企业微信文件\ying.jpg';  % 替换为你的图片路径（支持jpg/png/bmp等）
saveEdgeImg = true;          % 是否保存边缘图（true=保存，false=不保存）
savePath = 'edge_result.png';% 边缘图保存路径
cannyLowThresh = 0.1;        % Canny低阈值（越小检测边缘越多）
cannyHighThresh = 0.3;       % Canny高阈值（越大保留边缘越少）
gaussianSigma = 1;           % 高斯滤波核大小（去噪强度，1=轻度去噪）

%% ===================== 2. 导入图像 =====================
% 检查文件是否存在
if ~exist(imgPath, 'file')
    error('错误：找不到图片文件！请检查路径是否正确，路径为：%s', imgPath);
end

% 读取图像
img = imread(imgPath);
fprintf('成功导入图像，尺寸：%d×%d\n', size(img,1), size(img,2));

%% ===================== 3. 图像预处理（提升边缘检测效果） =====================
% 彩色图转灰度图（边缘检测对灰度图更友好）
if size(img, 3) == 3  % 判断是否为3通道彩色图
    imgGray = rgb2gray(img);
else
    imgGray = img;    % 已是灰度图，直接使用
end

% 高斯滤波去噪（减少噪声干扰，可选但推荐）
imgSmooth = imgaussfilt(imgGray, gaussianSigma);

%% ===================== 4. 核心：Canny边缘检测（效果最优） =====================
% Canny是最常用的边缘检测算法，抗噪性强、边缘完整
edgeImg = edge(imgSmooth, 'Canny', [cannyLowThresh, cannyHighThresh]);

%% ===================== 5. 显示结果（对比原图和边缘图） =====================
figure('Name','图像边缘检测结果','Position',[100,100,800,400]);  % 设置窗口位置和大小

% 子图1：原图
subplot(1,2,1);
imshow(img);
title('原始图像','FontSize',12);
axis on;  % 显示坐标轴（可改为axis off隐藏）

% 子图2：边缘检测结果
subplot(1,2,2);
imshow(edgeImg);
title('Canny边缘检测结果','FontSize',12);
axis on;

%% ===================== 6. 保存边缘图（可选） =====================
if saveEdgeImg
    imwrite(edgeImg, savePath);
    fprintf('边缘图已保存至：%s\n', savePath);
end

%% ===================== 7. 额外功能：调整参数交互提示 =====================
fprintf('\n参数调整建议：\n');
fprintf('1. 边缘太多（噪点）：增大cannyHighThresh或gaussianSigma\n');
fprintf('2. 边缘太少（不完整）：减小cannyLowThresh或gaussianSigma\n');
fprintf('3. 示例：cannyLowThresh=0.05, cannyHighThresh=0.2（更多边缘）\n');