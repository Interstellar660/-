clc
clear
close all;
I = imread('D:\Matlab\toolbox\images\imdata\cell.tif');
    J = imnoise(I,'salt & pepper',0.02);
subplot(2,3,1),
    imshow(I);
        %saveas(gcf,'picture_1.png');
subplot(2,3,2),
    imshow(J);
        %saveas(gcf,'picture_2.png');
k1 = medfilt2(J);
    k2 = medfilt2(J,[5 5]);
        k3 = medfilt2(J,[7 7]);
            k4 = medfilt2(J,[9 9]);
subplot(2,3,3),
    imshow(uint8(k1));
        %saveas(gcf,'picture_3.png');
subplot(2,3,4),
    imshow(uint8(k2));
        %saveas(gcf,'picture_4.png');
subplot(2,3,5),
    imshow(uint8(k3));
        %saveas(gcf,'picture_5.png');
subplot(2,3,6),
    imshow(uint8(k4));
        %saveas(gcf,'picture_6.png');
