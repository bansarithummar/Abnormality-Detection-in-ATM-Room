function skinColorRatio = skinColorRatio(I)
height = size(I,1);
width = size(I,2);
    
%Convert the image from RGB to YCbCr
img_ycbcr = rgb2ycbcr(I);
Cb = img_ycbcr(:,:,2);
Cr = img_ycbcr(:,:,3);
    
%Detect Skin
[r,c,v] = find(Cb>=77 & Cb<=129 & Cr>=125 & Cr<=173);
skincolor = size(r,1);
    
%Mark Skin Pixels
skinColorRatio = (skincolor / (height*width)) * 100;
prn = ['skin color ratio is : ', num2str(skinColorRatio)];
disp(prn);
end
