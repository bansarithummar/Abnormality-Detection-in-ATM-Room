clc;
close all;

file = fullfile('*:\****\video10.mp4');

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
    rem = mod(frame,25);
    
    if(rem==0)
        faceCount = ViolaJones(thisFrame);
        detectedFaces = sprintf('Number of faces in frame %4d : %d', frame,size(faceCount,1));

        disp(detectedFaces);
    else
        %progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        %disp(progressIndication);
    end
    
    numberOfFramesWritten = numberOfFramesWritten + 1;
end
