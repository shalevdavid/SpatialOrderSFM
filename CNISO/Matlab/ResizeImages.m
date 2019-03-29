% inputs
%path = 'D:\shalev\Projects\ProjectMSC\Code\colmap-dev\colmapDemo\imagesSmall_ImagesSmall\';
%path = 'D:\shalev\Projects\ProjectMSC\Code\colmap-dev\colmapDemo\imagesSmall_36_Features\';
path = 'D:\shalev\Projects\ProjectMSC\Code\colmap-dev\colmapDemo\imagesSmall_250_2000Features\';
sizeImg = [720 1280];

% procedure
pathJpg = [path '*.jpg']
imageFiles = dir(pathJpg);
nFiles = length(imageFiles);

for i = 1:nFiles
    x = imread([imageFiles(i).folder '\' imageFiles(i).name]);
    y = imresize(x, sizeImg);
    imwrite(y,[imageFiles(i).folder '\' imageFiles(i).name]);
end

x = randperm(nFiles)
y = x(1:250);
