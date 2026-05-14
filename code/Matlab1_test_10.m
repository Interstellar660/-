A=imread('C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\trees.tif');
[m,n]=size(A);
B=zeros(size(A));
I=m*n;
r=zeros(1,256);
y=zeros(1,256);
A=double(A);
for i=1:m
    for j=1:n
        r(A(i,j)+1)=r(A(i,j)+1)+1;
    end
end
r=r./I;
for k=1:256
    for j=1:k
        y(k)=y(k)+r(j);
    end
end
for k=1:256
    y(k)=floor(255*y(k)+0.5);
end
for i=1:m
    for j=1:n
        B(i,j)=y(A(i,j)+1);
    end
end
A=uint8(A);
B=uint8(B);
figure,imshow(A);
 saveas(gcf,'figure_output23.jpg');
figure,imhist(A);
 saveas(gcf,'figure_output24.jpg');
figure,imshow(B);
 saveas(gcf,'figure_output25.jpg');
figure,imhist(B);
 saveas(gcf,'figure_output26.jpg');
