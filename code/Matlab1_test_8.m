f = imread ( 'C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\trees.tif'); 
 g1=imnoise(f,'gaussian',0);
[m,n]=size(f);
K=zeros(m,n);
K1=K;
K2=K;
K3=K;
for i=1:4
    J=imnoise(g1,'gaussian',0,0.2);
    J1=im2double(J);
    K1=K1+J1;
end
K1=K1/4;
for i=1:8
    J=imnoise(g1,'gaussian',0,0.2);
    J2=im2double(J);
    K2=K2+J2;
end
K2=K2/8;
for i=1:16
   J=imnoise(g1,'gaussian',0,0.2);
    J3=im2double(J);
    K3=K3+J3;  
end
K3=K3/16;
imshow(f);
 saveas(gcf,'figure_output14.jpg');
figure,imshow(K1);
 saveas(gcf,'figure_output15.jpg');
figure,imshow(K2);
 saveas(gcf,'figure_output16.jpg');
figure,imshow(K3);
 saveas(gcf,'figure_output17.jpg');
