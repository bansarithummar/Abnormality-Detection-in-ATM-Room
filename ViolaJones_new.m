function faceCount = ViolaJones(sampleFrame)

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Returns Bounding Box values based on number of objects
faceCount = step(FDetect,sampleFrame);
