clc
clear
close all;
f = imread ('D:\Matlab\toolbox\images\imdata\pout.tif'); 
    F=fft2(f);                % Fourier Transform
        FC=fftshift(F);   %将变换原点移到频率矩形的中心。
subplot(1,2,1);
    imshow(abs(FC), [ ]);
        %saveas(gcf,'figure_output6.jpg');
S2= log(1+ abs(FC));
    subplot(1,2,2);
        imshow(S2, [ ]);
            %saveas(gcf,'figure_output5.jpg');