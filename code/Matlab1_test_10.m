clc
clear
close all;
A=imread('D:\Matlab\toolbox\images\imdata\saturn.png');
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
subplot(2,2,1),
    imshow(A);
        %saveas(gcf,'figure_output23.jpg');
subplot(2,2,2),
    imhist(A);
        %saveas(gcf,'figure_output24.jpg');
subplot(2,2,3),
    imshow(B);
        %saveas(gcf,'figure_output25.jpg');
subplot(2,2,4),
    imhist(B);
        %saveas(gcf,'figure_output26.jpg');
