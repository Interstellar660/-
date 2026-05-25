%% 设计实验1: 拉普拉斯算子边缘检测
% 清空工作区
    clear; 
        clc; 
            close all;

%% 第一步：读取并显示原始灰度图像
% 可将 'cameraman.tif' 换成任意灰度图像文件名
    f = imread('D:\Matlab\toolbox\images\imdata\liftingbody.png');
        if size(f, 3) == 3
            f = rgb2gray(f);          % 若为彩色图则转换为灰度
        end
    f = im2double(f);             % 转为 double 类型，范围 [0,1]
    figure('Name','设计实验1 - 拉普拉斯边缘检测');
        subplot(1, 3, 1);
            imshow(f); 
                title('原始灰度图像');
%% 第二步：定义8邻域拉普拉斯模板
% 4邻域模板
w4 = [0 -1  0;
     -1  4 -1;
      0 -1  0];

% 8邻域模板（对角方向也考虑）
 w8 = [-1 -1 -1;
      -1  8 -1;
      -1 -1 -1];

%% 第三步：对图像进行拉普拉斯滤波
    g = imfilter(f, w8, 'replicate');  % 'replicate' 处理边界
        g_abs = abs(g);                    % 取绝对值
            subplot(1, 3, 2);
                imshow(g_abs, []); 
                    title('拉普拉斯滤波结果');

%% 第四步：阈值化得到边缘二值图
% 阈值 T 取最大灰度的 15%
    T = 0.15 * max(g_abs(:));
        edge_map = g_abs >= T;             % 大于阈值的判定为边缘
            subplot(1, 3, 3);
                imshow(edge_map); title(['边缘检测结果 (T=', num2str(T,'%.3f'), ')']);

%% 第五步：调整阈值对比效果
    figure('Name','不同阈值对比');
        thresholds = [0.05, 0.15, 0.30, 0.50];
        for i = 1:4
            Ti = thresholds(i) * max(g_abs(:));
                edge_i = g_abs >= Ti;
                    subplot(2, 2, i);
                        imshow(edge_i);
                            title(['T = ', num2str(thresholds(i)*100), '% 最大值']);
        end
    sgtitle('不同阈值下的边缘检测结果');
    disp('实验1完成。');
