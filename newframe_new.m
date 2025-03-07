clc;
close all;

% Open an sample avi file
fnames = dir('*:\****\*.mp4');
tradata = cell(1,length(fnames));
for k=1:length(fnames)
  fname = fnames(k).name;
  %tradata{k} = dlmread(fname, ';', [82 2 1168 2]);


%filename = '.\003.AVI';
disp(fname);
mov = VideoReader(fname);

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
        
        if(size(faceCount,1)>1)
            detectedFaces = sprintf('%d faces detected : This is an abnormal activity', size(faceCount,1));
            disp(detectedFaces);
        end
    
    else
    end
    
    numberOfFramesWritten = numberOfFramesWritten + 1;
end
%progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
end
