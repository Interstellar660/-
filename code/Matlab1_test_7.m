f = imread ( 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\tire.tif'); 
 imshow(f);
  saveas(gcf,'figure_output12.jpg');
g1=imadjust(f,[0 1],[1 0],1);
figure,imshow(g1);
 saveas(gcf,'figure_output13.jpg');