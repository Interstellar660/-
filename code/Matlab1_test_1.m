 f = imread ( 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\saturn.png');
     [M, N] = size( f ); 
     g = imread ( 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\trees.tif'); 
     imshow ( f );
      saveas(gcf,'figure_output1.jpg');
     figure, imshow (g);      %显示另一幅图像
     imwrite (f, 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\s2.jpg');
     saveas(gcf,'figure_output.jpg');
