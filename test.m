% This is for path

pathFull = './****/clear face/'; % clear face
pathPartial = './****/Partial Face/'; % partial face

[fullFace, PartFace] = LBPfeatures(pathFull, pathPartial); 
new = cat(2,fullFace, PartFace);
