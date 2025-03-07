function faceCount = ViolaJones(sampleFrame)

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Returns Bounding Box values based on number of object
faceCount = step(FDetect,sampleFrame);
