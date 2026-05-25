clc
clear 
close all
f = imread ( 'D:\Matlab\toolbox\images\imdata\tire.tif'); 
    subplot(1,2,1) 
        imshow(f);
            %saveas(gcf,'figure_output12.jpg');
g1=imadjust(f,[0 1],[1 0],1);
    subplot(1,2,2),imshow(g1);
        %saveas(gcf,'figure_output13.jpg');