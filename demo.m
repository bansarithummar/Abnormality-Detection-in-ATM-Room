
clear; 
close all; 
clc;

% Add Path to svm library
addpath './svm_mex601/matlab/';
addpath './svm_mex601/bin/';

pathPos = './dataset/faces/';            % positive example
pathNeg = './dataset/non-faces/';        % negative example
pathFull = './dataset/clear face/';      % clear face
pathPartial = './dataset/Partial Face/'; % partial face


%% Learning part
if exist('model.mat','file')
    load model;
else
    [fpos, fneg] = features(pathPos, pathNeg);  % extract features
    [ model ] = trainSVM( fpos,fneg );          % train SVM
    save model model;
end

if exist('LBPmodel.mat','file')
    load LBPModel;
else
    [fullFace, PartFace] = LBPfeatures(pathFull, pathPartial);  % extract features
    LBPFeatures = cat(1,fullFace, PartFace);
    class=zeros(length(LBPFeatures),1);
    class(1:683,1)=1; %Clear Face db
    class(684:862,1)=2; %partial face db
    [ LBPModel ] = trainLBPSVM( LBPFeatures,class );
    save LBPModel LBPModel
end

%% Detection 
tSize = [24, 32];
videoPath='*:\*****\Oclussion_ Database\*.mp4';
fnames = dir(videoPath);
tradata = cell(1,length(fnames));
disp(length(fnames));
for k=1:length(fnames)
  fname = fnames(k).name;


  disp(fname);
  mov = VideoReader(fname);

%getting no of frames

numberOfFrames = mov.NumberOfFrames;
numberOfFramesWritten = 0;
for frame = 1 : numberOfFrames
    thisFrame = read(mov, frame);
    thisFrame = imrotate(thisFrame,-90);
    
    rem = mod(frame,100);
    if(rem==0)
        printData = ['Reading Frame Number : ', num2str(frame), ' from video : ',fname];    
        disp(printData);
        axis equal; axis tight; axis off;
        Img = imresize(thisFrame,[100 94]);
        imshow(Img); hold on;
        bBox = detect(Img,model,tSize);
        I = imcrop(Img,[bBox(1) bBox(2) 24 32]);
  
        skinColorRatio = skinColorRatio(I);
        I1 = rgb2gray(I);
        
        if (skinColorRatio < 70)
             disp('Partial Conceled Image by SCR');        
        else
             disp('Full Face Image by SCR');

        end
        testFeatures =  extractLBPFeatures(I1);
      
        [~,predictedLabels] = predict(LBPModel,testFeatures); 
        [~,index]=max(predictedLabels);
        
        
        if(index==2)
            disp('Partially Concealed Image by LBP');
        elseif(index==1)
            disp('Full Face Image by LBP ');
        end
        
        if(index==2&&skinColorRatio > 70)
            disp('Partially Concealed Image by Both Prediction');
            break
        else
            disp('Full Face Image by Both Prediction');
        end  
           
        outputBaseFileName = sprintf('%3.3d.png', frame);
        outputFullFileName = fullfile('./results/', outputBaseFileName);
        imwrite(I, outputFullFileName, 'png');
        
        close all;
        clear ('I','img','bBox','s','skinColorRatio','I1','testFeatures','predictedLabels','index');
    else
        
    end
end

end
