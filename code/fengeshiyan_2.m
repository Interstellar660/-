%% 设计实验2: 直方图谷值阈值分割
clear; 
    clc; 
        close all;

%% 第一步：读取灰度图像
    f = imread('D:\Matlab\toolbox\images\imdata\liftingbody.png');
    if size(f, 3) == 3
        f = rgb2gray(f);
    end

%% 第二步：计算并显示灰度直方图
    figure('Name','设计实验2 - 直方图谷值阈值分割');
        subplot(2, 3, 1); 
            imshow(f); 
                title('原始图像');
    [counts, grayvals] = imhist(f, 256);  % 256个灰度级
        subplot(2, 3, 2);
            bar(grayvals, counts, 'b'); 
                xlabel('灰度值'); 
                    ylabel('像素数');
                        title('原始直方图');

%% 第三步：对直方图进行平滑（高斯核，sigma=3）
    sigma = 3;
        kernel_size = 2 * ceil(3*sigma) + 1;
            x = linspace(-ceil(3*sigma), ceil(3*sigma), kernel_size);
                gauss_kernel = exp(-x.^2 / (2*sigma^2));
                    gauss_kernel = gauss_kernel / sum(gauss_kernel);
                        smooth_hist = conv(double(counts), gauss_kernel, 'same');
    subplot(2, 3, 3);
        plot(grayvals, smooth_hist, 'r', 'LineWidth', 1.5);
            xlabel('灰度值');
                ylabel('频率');
                    title('平滑后直方图');

%% 第四步：寻找谷值（两峰之间的局部最小值）
% 找局部极大值（峰）
    peaks_idx = find(diff(sign(diff(smooth_hist))) < 0) + 1;
% 按高度降序排列，取前两个峰
    [~, sort_idx] = sort(smooth_hist(peaks_idx), 'descend');
        top2_peaks = sort(peaks_idx(sort_idx(1:min(2,end))));
            if numel(top2_peaks) >= 2
            % 在两峰之间寻找谷值
                between = smooth_hist(top2_peaks(1):top2_peaks(2));
                    [~, valley_local] = min(between);
                        valley_idx = top2_peaks(1) + valley_local - 2;  % 映射回全局索引
                            T_valley = grayvals(valley_idx);
                                fprintf('检测到双峰，谷值阈值 T = %d\n', T_valley);
            else
            % 未检测到双峰，使用 Otsu 方法作为备选
            T_norm = graythresh(f);
                    T_valley = round(T_norm * 255);
                        fprintf('未检测到明显双峰，使用Otsu阈值 T = %d\n', T_valley);
            end

% 在平滑直方图上标注谷值
    subplot(2, 3, 3); hold on;
        plot(T_valley, smooth_hist(valley_idx), 'go', 'MarkerSize', 10, ...
     'MarkerFaceColor', 'g');
            xline(T_valley, '--g', ['T=', num2str(T_valley)], 'LineWidth', 1.5);
                legend('平滑直方图', '谷值点');

%% 第五步：使用谷值 T 进行二值化分割
    T_norm = T_valley / 255;
        bw_valley = im2bw(f, T_norm);
            subplot(2, 3, 4);
                imshow(bw_valley); title(['谷值分割 T=', num2str(T_valley)]);

%% 第六步：与默认阈值0.5及Otsu法对比
    bw_default = im2bw(f, 0.5);
        subplot(2, 3, 5);
            imshow(bw_default);
                title('默认阈值 T=0.5 (127)');
                    level_otsu = graythresh(f);
                        bw_otsu = im2bw(f, level_otsu);
    subplot(2, 3, 6);
        imshow(bw_otsu); 
            title(['Otsu法 T=', num2str(round(level_otsu*255))]);
                sgtitle('阈值分割方法对比');
                    fprintf('谷值法 T=%d | Otsu T=%d\n', T_valley, round(level_otsu*255));
    disp('实验2完成。');
