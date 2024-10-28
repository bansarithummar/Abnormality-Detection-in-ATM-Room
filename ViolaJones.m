function faceCount = ViolaJones(sampleFrame)

%To detect Fa
FDetect = vision.CascadeObjectDetector;

%Returns Bounding Box values based on number of objects
faceCount = step(FDetect,sampleFrame);

