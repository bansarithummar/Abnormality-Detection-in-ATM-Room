function [ model ] = trainSVM( fpos,fneg )
    SV = loadingV(fpos,fneg);   % loading and labeling each training example
    fprintf('Training SVM..\n');
    T = cell2mat(SV(1,:));
    P = cell2mat(SV(2,:)'); % each row of P correspond to a training example 
    disp(SV);
    model = svmlearn(P, T', '-t -g 0.3 -c 0.5');
    fprintf('done. \n');
e

