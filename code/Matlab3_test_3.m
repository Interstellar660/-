% ===== 实验1：改变维纳滤波常数 K，比较复原效果 =====
clear; close all;

% 1. 读入图像并转为灰度
I = imread('C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\cameraman.tif');
if size(I,3) == 3
    I = rgb2gray(I);
end
I = im2double(I);

% 2. 生成运动模糊的 PSF
LEN = 21;          % 模糊长度（像素）
THETA = 11;        % 模糊角度（度）
psf = fspecial('motion', LEN, THETA);

% 3. 产生模糊且加噪的退化图像
blurred = imfilter(I, psf, 'conv', 'circular');
noise_var = 0.001;                 % 噪声方差
blurred_noisy = imnoise(blurred, 'gaussian', 0, noise_var);

% 4. 计算真实的噪声-信号功率比（NSR）
signal_var = var(blurred_noisy(:));
NSR_true = noise_var / signal_var;

% 5. 定义一组不同的 K 值进行测试
K_values = [0, 1e-6, NSR_true, 0.01, 0.1];
figure('Name', '不同K值的维纳滤波复原');

for i = 1:length(K_values)
    K = K_values(i);
    res = deconvwnr(blurred_noisy, psf, K);
    
    subplot(2, 3, i);
    imshow(res, []);
    
    % 标题说明
    if K == 0
        title('K = 0 (逆滤波)');
    elseif abs(K - NSR_true) < 1e-10
        title(['真实 NSR = ', num2str(NSR_true, '%.2e')]);
    else
        title(['K = ', num2str(K)]);
    end
end

% 6. 同时显示原始图和退化图用于对比
subplot(2,3,6);
imshow(blurred_noisy);
title('模糊+噪声图像');
saveas(gcf,'image_3.0.0.png');
