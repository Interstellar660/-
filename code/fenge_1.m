clc;
clear;
close all;
f=imread( "D:\Matlab\toolbox\images\imdata\cameraman.tif");
    subplot(1,2,1);
        imshow(f)
            title('原图')
[g,~]=edge(f,'roberts',[],'both');
    subplot(1,2,2);
        imshow(g);
            title( '边缘检测’');
[g,t] = edge(f,'sobel',[],'both')
    %saveas(gcf,'fenge_1.png')