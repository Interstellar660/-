clc;
clear;
close all;
C=imread('C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\trees.tif');
subplot(1,2,1);
imshow(C);
saveas(gcf,'image1.0.jpg');
len=30;    %设置运动位移为30个像素
theta=45;   %设置运动角度为45度
psf=fspecial('motion',len,theta);  %建立二维仿真线性运动滤波器
MF=imfilter(C,psf,'circular','conv');   %用psf产生退化图像 
subplot(1,2,2);
imshow(MF);
imwrite(MF,'image1.1.jpg'); %保存图像
saveas(gcf,'image1.1.1.jpg');