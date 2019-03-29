path = 'D:\shalev\Projects\ProjectMSC\Code\colmap-dev\colmapDemo\imagesSmall_250_2000Features_1st\';
numFilesToChoose = 250;

% procedure
pathJpg = [path '*.jpg']
imageFiles = dir(pathJpg);
nFiles = length(imageFiles);

x = randperm(nFiles);
y = x(1:(nFiles-numFilesToChoose)); % chosse files to delete so numFilesToChoose are randomaly kept.

for i = y
    fileName = [imageFiles(i).folder '\' imageFiles(i).name];
    delete(fileName)
end

