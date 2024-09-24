clear all
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('D:\Dissertation\disseratation code\video16\245.png');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I); 
hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
e
title('Face Detection');
hold off;
