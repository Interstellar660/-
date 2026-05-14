I = imread('C:\Program Files\MATLAB\R2021b\toolbox\images\imdata\eight.tif');
figure(),imshow(I);
saveas(gcf,'test3_picture_1.png');
I = double(I);
f = fft2(I);
g = fftshift(f);
figure(),imshow(log(abs(g)),[]);
saveas(gcf,'test3_picture_2.png');
[M, N] = size(f);
n1 = floor(M/2);
n2 = floor(N/2);
d0 = 5;
for i =1:M
    for j =1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        if d<=d0
            h=1;
        else
            h=0;
        end
        g1(i,j)=h*g(i,j);
    end
end
g1=ifftshift(g1);
g1=uint8(real(ifft2(g1)));
figure(),imshow(g1);
saveas(gcf,'test3_picture_3.png');
    