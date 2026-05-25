clc
clear
close all;
f = imread ( 'D:\Matlab\toolbox\images\imdata\trailer.jpg'); 
    subplot(2,2,1)
        imshow(f);
            %saveas(gcf,'figure_output4.jpg');
g1=imadjust(f, [0 1], [1 0]); 
    subplot(2,2,2), 
        imshow(g1);
            %saveas(gcf,'figure_output2.jpg');
g2=imadjust(f, [0.5 0.75], [1 0], 0.5); 
    subplot(2,2,3) 
        imshow(g2)
            %saveas(gcf,'figure_output3.jpg');
