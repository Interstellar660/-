clc
clear 
close all
f=imread ( 'D:\Matlab\toolbox\images\imdata\tire.tif'); 
    subplot(2,2,1); 
        imshow(f);
            %saveas(gcf,'figure_output8.jpg');
 subplot(2,2,2),
     imhist(f);
         ylim('auto'); 
            %saveas(gcf,'figure_output9.jpg');%自动设定y轴坐标范围和刻度
 g=histeq(f,256);
    subplot(2,2,3), imshow(g);
        %saveas(gcf,'figure_output10.jpg');
 subplot(2,2,4),
    imhist(g);
        ylim('auto');
            %saveas(gcf,'figure_output11.jpg');