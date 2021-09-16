clearvars

%Compute the maximum intensity projection of each image
mipGood1 = computeMIP('good_1.nd2');
mipGood2 = computeMIP('good_2.nd2');
mipBad1 = computeMIP('bad_1.nd2');
mipBad2 = computeMIP('bad_2.nd2');

fiberDetThresh = 0.1;

%Classify the image (1 = distinct fibers, 0 = diffuse or non-existent)
classifyFibers(mipGood1, fiberDetThresh)
classifyFibers(mipGood2, fiberDetThresh)
classifyFibers(mipBad1, fiberDetThresh)
classifyFibers(mipBad2, fiberDetThresh)

