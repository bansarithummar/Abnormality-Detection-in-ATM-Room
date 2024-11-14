% This is for path

pathFull = './dataset/clear face/'; % clear face
pathPartial = './dataset/Partial Face/'; % partial face

[fullFace, PartFace] = LBPfeatures(pathFull, pathPartial); 
new = cat(2,fullFace, PartFace);
