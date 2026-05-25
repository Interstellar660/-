%% 设计实验3: 三种算子边缘检测对比
    clear; 
        clc; 
            close all;

%% 第一步：读取图像
    f = imread('D:\Matlab\toolbox\images\imdata\cameraman.tif');
        if size(f, 3) == 3
            f = rgb2gray(f);
        end

%% 第二步：使用 MATLAB edge() 函数进行边缘检测
% Roberts 算子
    [g_roberts, t_roberts] = edge(f, 'roberts');
        fprintf('Roberts 自动阈值 t = %.4f\n', t_roberts);
% Sobel 算子（水平+垂直方向）
    [g_sobel, t_sobel] = edge(f, 'sobel', [], 'both');
        fprintf('Sobel   自动阈值 t = %.4f\n', t_sobel);
% LoG 算子（拉普拉斯高斯）
    [g_log, t_log] = edge(f, 'log');
        fprintf('LoG     自动阈值 t = %.4f\n', t_log);

%% 第三步：显示结果对比
    figure('Name','设计实验3 - 三种算子边缘检测对比', 'Position',[100 100 1100 600]);
        subplot(2, 4, 1); 
            imshow(f);
                title('原始图像');
        subplot(2, 4, 2);
            imshow(g_roberts); 
                title(['Roberts (T=', num2str(t_roberts,'%.3f'), ')']);
        subplot(2, 4, 3);
            imshow(g_sobel);
                title(['Sobel   (T=', num2str(t_sobel,'%.3f'), ')']);
        subplot(2, 4, 4);
            imshow(g_log);
                title(['LoG     (T=', num2str(t_log,'%.4f'), ')']);
%% 第四步：手动指定阈值，观察灵敏度差异
    T_manual = 0.05;
        g_rob2  = edge(f, 'roberts', T_manual);
            g_sob2  = edge(f, 'sobel',   T_manual, 'both');
                g_log2  = edge(f, 'log',     T_manual/10);  % LoG阈值量级更小
    subplot(2, 4, 6);
        imshow(g_rob2);
            title(['Roberts T=', num2str(T_manual)]);
    subplot(2, 4, 7);
        imshow(g_sob2);
            title(['Sobel T=', num2str(T_manual)]);
    subplot(2, 4, 8);
        imshow(g_log2); 
            title(['LoG T=', num2str(T_manual/10)]);
    sgtitle('三种边缘检测算子对比');

%% 第五步：统计边缘像素数，量化对比
    fprintf('\n===== 边缘像素统计（自动阈值）=====\n');
        fprintf('Roberts: %6d 个边缘像素\n', sum(g_roberts(:)));
            fprintf('Sobel:   %6d 个边缘像素\n', sum(g_sobel(:)));
                fprintf('LoG:     %6d 个边缘像素\n', sum(g_log(:)));

%% 第六步：在含噪图像上对比三种算子的噪声鲁棒性
    f_noisy = imnoise(f, 'gaussian', 0, 0.01);  % 添加高斯噪声
        figure('Name','含噪图像对比');
            subplot(1, 4, 1); imshow(f_noisy); title('含噪图像');
                subplot(1, 4, 2); imshow(edge(f_noisy,'roberts')); title('Roberts（含噪）');
                    subplot(1, 4, 3); imshow(edge(f_noisy,'sobel',[],'both')); title('Sobel（含噪）');
                        subplot(1, 4, 4); imshow(edge(f_noisy,'log')); title('LoG（含噪）');
                            sgtitle('含噪声图像下三种算子的鲁棒性对比');
    disp('实验3完成。');
