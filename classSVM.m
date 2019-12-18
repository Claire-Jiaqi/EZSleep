clc;

data = exact_feature;
train = data(:,1:3);                                            
group = data(:,4); 
n = size(train,1);
   
isInds = 1:(n-10);   % In-sample indices 
oosInds = (n-9):n;   % Out-of-sample indices

%SVMModel = fitcsvm(train(isInds,:),group(isInds),'Standardize',true,'ClassNames',{'0','1'});
%CompactSVMModel = compact(SVMModel);
%whos('SVMModel','CompactSVMModel')
%CompactSVMModel = fitPosterior(CompactSVMModel,train(isInds,:),group(isInds));
%[labels,PostProbs] = predict(CompactSVMModel,train(oosInds,:));
%table(group(oosInds),labels,PostProbs(:,2),'VariableNames',{'TrueLabels','PredictedLabels','PosClassPosterior'});

SVMModel = fitcsvm(train,group,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');
CVSVMModel = crossval(SVMModel);
classLoss = kfoldLoss(CVSVMModel);
%CVSVMModel = fitcsvm(train,group,'Holdout',0.15,'ClassNames',{'0','1'},'Standardize',true);
%CompactSVMModel = CVSVMModel.Trained{1};  % Extract trained, compact classifier
%testInds = test(CVSVMModel.Partition);   % Extract the test indices
%XTest = X(testInds,:);
%YTest = Y(testInds,:);

%[label,score] = predict(CompactSVMModel,XTest);
%table(YTest(1:10),label(1:10),score(1:10,2),'VariableNames',{'TrueLabel','PredictedLabel','Score'})

%CVSVMModel = fitcsvm(train,group,'Standardize',true,'ClassNames',{'0','1'},'CrossVal','on');
%genError = kfoldLoss(CVSVMModel);
