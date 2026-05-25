clc
clear
close all;
subplot(1,3,1);
    f=imread ("D:\Matlab\toolbox\images\imdata\cameraman.tif");
        [M, N] = size( f );
subplot(1,3,2);
    g=imread ( 'D:\Matlab\toolbox\images\imdata\trees.tif'); 
        imshow ( f );
            %saveas(gcf,'figure_output1.jpg');
subplot(1,3,3), 
    imshow (g);      %显示另一幅图像
        imwrite (f, 'D:\Matlab\toolbox\images\imdata\s2.jpg');
            %saveas(gcf,'figure_output.jpg');
