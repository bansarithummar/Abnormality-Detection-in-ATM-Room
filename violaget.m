clear all
clc

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('*:\505.png');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end

title('Face Detection');
hold off;
