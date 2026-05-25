clc;
clear;
close all;
img=imread('D:\Matlab\toolbox\images\imdata\cameraman.tif');
    if size(img,3)==3
        img=rgb2gray(img);
    end
img=im2double(img);
    [0,1]
        [M,N] = size(img);
F = fft2(img);
    F_shift = fftshift(F);
        F_mag = log(1 + abs(F_shift));
D0=50;
    n=2;
        u=1:N;
v = 1:M;
    [U,V] = meshgrid(u,v);
D = sqrt((U - floor(N/2)).^2 + (V-floor(M/2)).^2);
    H_low = 1./(1+0.414 * (D./D0).^(2*n));
        D(D==0) = 1e-10;
            H_high = 1./(1+0.414 * (D0./D).^(2*n));
G_low = F_shift .* H_low;
    G_high = F_shift .* H_high;
        img_low = real(ifft2(ifftshift(G_low)));
            img_high = real(ifft2(ifftshift(G_high)));
subplot(2,3,1),
    imshow(img);title('原始图像');
        %saveas(gcf,'test4_picture1.png');
subplot(2,3,2),
    imshow(F_mag,[ ]);title('频谱(log)');
        %saveas(gcf,'test4_picture2.png');
subplot(2,3,3),
    imshow(H_low,[ ]);title('低通滤波器H(u,v)');
        %saveas(gcf,'test4_picture3.png');
subplot(2,3,4),
    imshow(img_low);title('低通滤波结果');
        %saveas(gcf,'test4_picture4.png');
subplot(2,3,5),
    imshow(img_high);title('高通滤波结果');
        %saveas(gcf,'test4_picture5.png');
subplot(2,3,6),
    imshow(H_high,[ ]);title('高通滤波器 H(U,V)');
        %saveas(gcf,'test4_picture6.png');


