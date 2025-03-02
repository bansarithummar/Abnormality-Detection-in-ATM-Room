clc;
close all;

file = fullfile('*:\*****\video5.mp4');

%filename = '.\003.AVI';
mov = VideoReader(file);

% Output folder

outputFolder = fullfile(cd, 'frames');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

numberOfFrames = mov.NumberOfFrames;
numberOfFramesWritten = 0;

for frame = 1 : numberOfFrames
    thisFrame = read(mov, frame);
    thisFrame = imrotate(thisFrame,-90);
    outputBaseFileName = sprintf('%3.3d.png', frame);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite(thisFrame, outputFullFileName, 'png');
    
        progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        disp(progressIndication);
    
    end
    numberOfFramesWritten = numberOfFramesWritten + 1;
progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
disp(progressIndication);
