clc
clear
close all;
f=[1 2; 3 4];
    g=mat2gray(f);
        gb=imbinarize(g, 0.6);     %0.6 is a threshold
            plot(gb)
                %saveas(gcf,"test.jpg")