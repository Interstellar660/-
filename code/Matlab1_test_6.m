f = imread ( 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\tire.tif'); 
 imshow(f);
 saveas(gcf,'figure_output8.jpg');
 figure,imhist(f);
 ylim('auto'); 
 saveas(gcf,'figure_output9.jpg');%自动设定y轴坐标范围和刻度
 g=histeq(f,256);
 figure, imshow(g);
 saveas(gcf,'figure_output10.jpg');
 figure,imhist(g);
 ylim('auto');
saveas(gcf,'figure_output11.jpg');