clc;
    clear;
        close all;
I = imread('D:\Matlab\toolbox\images\imdata\liftingbody.png');
    S = qtdecomp(I,.27);%以阈值ceil(0.27*255)=69对图像I进行四叉分解
        blocks = repmat(uint8(0),size(S));%得到一个和I同尺寸的黑色背景blocks
    for dim = [512 256 128 64 32 16 8 4 2 1];    %分块全是2的整数次幂，注①
        numblocks = length(find(S==dim));    %有numblocks个尺寸为dim的分块，注③
        if (numblocks > 0)       
            values = repmat(uint8(1),[dim dim numblocks]);%产生一个dim x dim x numblocks的三维1值矩阵（或说%  numblocks个尺寸为dim x dim的1值block）
                values(2:dim,2:dim,:) = 0;
                    blocks = qtsetblk(blocks,S,dim,values);%blocks保存了所有块被替换后的结果。注④
        end
    end
blocks(end,1:end) = 1;
    blocks(1:end,end) = 1;
        subplot(1,2,1)    
            imshow(I),
                %saveas(gcf,'fenge_3.1.png');
subplot(1,2,2), 
    imshow(blocks,[])
        %saveas(gcf,'fenge_3.2.png');
