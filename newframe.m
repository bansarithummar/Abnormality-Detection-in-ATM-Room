clc;
close all;

% Open an sample avi file

%[FileName,PathName] = uigetfile('*.mp4','D:\video');
file = fullfile('D:\Database\video5.mp4');

%filename = '.\003.AVI';
mov = VideoReader(file);

% Output folder

outputFolder = fullfile(cd, 'frames');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
e

%getting no of frames

numberOfFrames = mov.NumberOfFrames;
numberOfFramesWritten = 0;
for frame = 225 : 235

    thisFrame = read(mov, frame);
    thisFrame = imrotate(thisFrame,-90);
    outputBaseFileName = sprintf('%3.3d.png', frame);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite(thisFrame, outputFullFileName, 'png');
	faceCount = ViolaJones(thisFrame);
    progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
	detectedFaces = sprintf('Number of faces in frame %4d : %d', frame,faceCount);
    disp(progressIndication);
	disp(detectedFaces);
    numberOfFramesWritten = numberOfFramesWritten + 1;
end
progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
disp(progressIndication);
