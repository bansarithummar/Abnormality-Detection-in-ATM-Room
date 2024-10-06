clc;
close all;

% Open an sample avi file

fnames = dir('D:\Database\*.mp4');
tradata = cell(1,length(fnames));
for k=1:length(fnames)
  fname = fnames(k).name;
  %tradata{k} = dlmread(fname, ';', [82 2 1168 2]);
%[FileName,PathName] = uigetfile('*.mp4','D:\video');
%file = fullfile('H:\Matlab\Bansari\video16.mp4');

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
    %outputBaseFileName = sprintf('%3.3d.png', frame);
    %outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    %imwrite(thisFrame, outputFullFileName, 'png');
    rem = mod(frame,25);
    if(rem==0)
        faceCount = ViolaJones(thisFrame);
        %progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        %detectedFaces = sprintf('Number of faces in frame %4d : %d', frame,size(faceCount,1));
        if(size(faceCount,1)>1)
            detectedFaces = sprintf('%d faces detected : This is an abnormal activity', size(faceCount,1));
            %disp(progressIndication);
            disp(detectedFaces);
        end
    else
        %progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        %disp(progressIndication);
    end
    numberOfFramesWritten = numberOfFramesWritten + 1;
end
%progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
e
