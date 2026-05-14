clear; close all;

% 1. 读图并转换为灰度
I = imread('C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\cameraman.tif');
if size(I,3) == 3
    I = rgb2gray(I);
end
I = im2double(I);

% 2. 运动模糊 PSF
LEN = 21;
THETA = 11;
psf = fspecial('motion', LEN, THETA);

% 3. 生成两种退化图像：无噪声模糊、有噪声模糊
blurred_noiseless = imfilter(I, psf, 'conv', 'circular');
noise_var = 0.001;
blurred_noisy = imnoise(blurred_noiseless, 'gaussian', 0, noise_var);

% 4. 逆滤波（NSR = 0）
inv_noiseless = deconvwnr(blurred_noiseless, psf, 0);   % 无噪声逆滤波
inv_noisy     = deconvwnr(blurred_noisy, psf, 0);       % 有噪声逆滤波

% 5. 维纳滤波（使用真实 NSR）
signal_var = var(blurred_noisy(:));
NSR = noise_var / signal_var;
wiener_noisy = deconvwnr(blurred_noisy, psf, NSR);      % 有噪声维纳滤波

% 6. 显示对比结果
figure('Name', '逆滤波与维纳滤波对比');

subplot(2,3,1); imshow(I);                title('原始图像');
subplot(2,3,2); imshow(blurred_noiseless);title('无噪声运动模糊');
subplot(2,3,3); imshow(blurred_noisy);    title('有噪声运动模糊');

subplot(2,3,4); imshow(inv_noiseless);    title('逆滤波（无噪声）');
subplot(2,3,5); imshow(inv_noisy);        title('逆滤波（有噪声）');
subplot(2,3,6); imshow(wiener_noisy);     title('维纳滤波（有噪声）');
saveas(gcf,'image_4.0.0.png');
