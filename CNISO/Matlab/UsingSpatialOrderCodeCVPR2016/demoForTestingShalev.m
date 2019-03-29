resolution = 0.1;

secondSeq = [15, 6, 1, 13, 4, 3, 11, 5, 2, 14, 8, 7, 10, 12, 0, 9, 16, 17, 18, 21, 19, 20, 23, 22, 24, 25, 26, 27, 34, 28, 29, 31, 32, 30, 33, 36, 35, 37, 38, 39, 40, 41, 42, 68, 69, 70, 53, 54, 63, 64, 45, 67, 57, 55, 56, 43, 59, 46, 47, 65, 48, 62, 50, 51, 52, 66, 58, 44, 60, 61, 49];
secondSeq = randperm(2000);


tic
[jointlyInlierRate, startNum1, endNum1, startNum2, endNum2] = estimateKendallInlierRateJointlyWindows(secondSeq,resolution);
toc
%tJointlyKendall = toc;
jointlyKendallWindow = [startNum1 ; endNum1 ; startNum2 ; endNum2]

secondSeqForCpp = secondSeq - 1;
secondSeqForCppString = sprintf('%.0f,' , secondSeqForCpp);
clc

diary ('myVariable.txt');



['// ' num2str(jointlyKendallWindow')]
secondSeqForCppString = secondSeqForCppString(1:end-1);% strip final comma
[ 'vector<int> sigmaInput = vector<int>({', num2str(secondSeqForCppString) ,'});' ]


diary off

% Putting it all together
features1 = randperm(2000);
features2 = randperm(2000);

features1_ForCpp = features1 - 1;
features1_ForCppString = sprintf('%.0f,' , features1_ForCpp);
features1_ForCppString = features1_ForCppString(1:end-1);% strip final comma
features2_ForCpp = features2 - 1;
features2_ForCppString = sprintf('%.0f,' , features2_ForCpp);
features2_ForCppString = features2_ForCppString(1:end-1);% strip final comma
clc

diary ('PuttingItAllTogether.txt');


[ 'vector<int> X_features1 = vector<int>({', num2str(features1_ForCppString) ,'});' ]
[ 'vector<int> X_features2 = vector<int>({', num2str(features2_ForCppString) ,'});' ]

diary off


