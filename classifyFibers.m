function hasFibers = classifyFibers(mipImage, fmThresh)
%CLASSIFYFIBERS  Classify fibers as distinct or not
%
%  L = CLASSIFYFIBERS(M, T) will identify and classify fibers in a
%  fluorescent image. If the fibers are distinct lines, L will be true. For
%  diffuse fluorescence, L will be false.
%
%  The code works by first finding lines in an image using the MATLAB
%  function fibermetric. This line image is then thresholded by the value T
%  to get a line mask. Lowering the threshold T will cause weaker lines to
%  appear in the mask. The code then quantifies whether an image has
%  distinct lines or not by counting the number of true pixels, which must
%  be at least 1.2% of the total number of pixels in the image.

fm = fibermetric(mipImage, [3 7]);
fiberMask = fm > fmThresh;

if ~any(fiberMask(:))
    hasFibers = false;    
elseif nnz(fiberMask) > (0.012 * numel(mipImage))
    hasFibers = true;
else
    hasFibers = false;    
end

% disp(nnz(fiberMask))
% disp(numel(mipImage))
% 
% figure;
% showoverlay(mipImage, fiberMask)

end