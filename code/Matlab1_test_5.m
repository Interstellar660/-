clc
clear
close all;
f = imread ('D:\Matlab\toolbox\images\imdata\pout.tif'); 
    imhist(f);
        %saveas(gcf,'figure_output7.jpg');