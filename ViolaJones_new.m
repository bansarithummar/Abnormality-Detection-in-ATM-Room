function faceCount = ViolaJones(sampleFrame)

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Returns Bounding Box values based on the number of objects
faceCount = step(FDetect,sampleFrame);
