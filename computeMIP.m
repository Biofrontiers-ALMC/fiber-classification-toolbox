function mip = computeMIP(filename)
%COMPUTEMIP  Compute the maximum intensity projection
%
%  M = COMPUTEMIP(ND2FILE) will read a Nikon microscope image (.nd2) file
%  containing a z-stack image dataset and compute the maximum intensity
%  projection M.
%
%  Example: M = COMPUTEMIP('filename.nd2')

bfr = BioformatsImage(filename);

storeI = zeros(bfr.height, bfr.width, bfr.sizeZ, 'uint16');
for iZ = 1:bfr.sizeZ
    storeI(:, :, iZ) = getPlane(bfr, 1, 'TRITC', 1);
end

mip = max(storeI, [], 3);

end