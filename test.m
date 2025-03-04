% This is for path

pathFull = './****/clear face/'; 
pathPartial = './****/Partial Face/'; 

[fullFace, PartFace] = LBPfeatures(pathFull, pathPartial); 
new = cat(2,fullFace, PartFace);
