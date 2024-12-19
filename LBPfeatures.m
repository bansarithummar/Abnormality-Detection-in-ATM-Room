function [fullFace, PartFace] = LBPfeatures(pathFull, pathPartial)   
    imlist = dir([pathFull '*.png']);
    fullFace = zeros(length(imlist),59);
    for i = 1:length(imlist)
        
        im = imread([pathFull imlist(i).name]);
        im = imresize(im,[25 32]);
        if size(im,3)==3
            img=rgb2gray(im);
        end
        fullFace(i,:) = extractLBPFeatures(img);
    end
    
    % extract features for negative examples
    imlist = dir([pathPartial '*.png']);
    PartFace = zeros(length(imlist),59);
    for i = 1:length(imlist)
        im = imread([pathPartial imlist(i).name]);
        im = imresize(im,[25 32]);
        if size(im,3)==3
            img=rgb2gray(im);
        end
        PartFace(i,:) = extractLBPFeatures(img);
    end
end
