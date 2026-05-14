clc;
clear;
close all;
C=imread('image1.1.jpg');
subplot(1,3,1);
imshow(C);
len=30;
theta=45;
psf=fspecial('motion',len,theta);
[MF,p]=deconvblind(C,psf,30);   %去卷积
subplot(1,3,2);
imshow(MF);
subplot(1,3,3);
imshow(p,[ ],"InitialMagnification",'fit');