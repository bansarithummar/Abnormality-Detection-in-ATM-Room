function faceCount = ViolaJones(sampleFrame)


FDetect = vision.CascadeObjectDetector;


faceCount = step(FDetect,sampleFrame);