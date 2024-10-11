function [ LBPModel ] = trainLBPSVM( LBPFeatures,class )
    LBPModel = fitcsvm(LBPFeatures,class);
    fprintf('done. \n');
e

