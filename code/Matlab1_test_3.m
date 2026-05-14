f = imread ( 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\pout.tif'); 
imshow(f);
saveas(gcf,'figure_output4.jpg');
g1=imadjust(f, [0 1], [1 0]); 
figure, 
imshow(g1);
saveas(gcf,'figure_output2.jpg');
g2=imadjust(f, [0.5 0.75], [1 0], 0.5); 
figure, 
imshow(g2)
saveas(gcf,'figure_output3.jpg');
