function feat = grad_coherence(imgI)
if(ndims(imgI) == 3)
    imgI = double(rgb2gray(imgI));
else
    imgI = double(imgI);
end
    
blocksizerow     = 9;
blocksizecol     = blocksizerow;
blockrowoverlap  = 0;
blockcoloverlap  = 0;

[row, col]     = size(imgI);
block_rownum  = floor(row/blocksizerow);
block_colnum  = floor(col/blocksizecol);

structdis     = imgI(1:block_rownum*blocksizerow,1:block_colnum*blocksizecol);
feat             = blkproc(structdis,[blocksizerow blocksizecol], [blockrowoverlap blockcoloverlap],@grad_coherence_helper);
feat = feat(:);   
end


function gradCoherence_block = grad_coherence_helper(imgI)
[rows, cols] = size(imgI);
maskSize = max([rows, cols]); 
DoG = difference_of_gaussian_kernels(maskSize);

Ix = conv2(imgI, DoG.Gx,'same');
Iy = conv2(imgI, DoG.Gy,'same');

diagElem = sum(Ix(:).*Iy(:));
MI = [sum(Ix(:).^2), diagElem; diagElem, sum(Iy(:).^2)];
  
eVec = eig(MI); 
gradCoherence_block = ((eVec(1)-eVec(2))/(eVec(1)+eVec(2)))^2; %((l1-l2)/(l1+l2))^2;      
end