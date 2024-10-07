clc;
close all;

% Open an sample avi file

%[FileName,PathName] = uigetfile('*.mp4','D:\video');
file = fullfile('D:\DATABASE\video10.mp4');

%filename = '.\003.AVI';
mov = VideoReader(file);

% Output folder

outputFolder = fullfile(cd, 'frames');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

%getting no of frames

numberOfFrames = mov.NumberOfFrames;
numberOfFramesWritten = 0;
for frame = 1 : numberOfFrames
    thisFrame = read(mov, frame);
    thisFrame = imrotate(thisFrame,-90);
    %outputBaseFileName = sprintf('%3.3d.png', frame);
    %outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    %imwrite(thisFrame, outputFullFileName, 'png');
    rem = mod(frame,25);
    if(rem==0)
        faceCount = ViolaJones(thisFrame);
        %progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        detectedFaces = sprintf('Number of faces in frame %4d : %d', frame,size(faceCount,1));
        %disp(progressIndication);
        disp(detectedFaces);
    else
        %progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        %disp(progressIndication);
    end
    numberOfFramesWritten = numberOfFramesWritten + 1;
e
%progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
%disp(progressIndication);
