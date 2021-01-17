% The investigators in this research are: 
% Debarati Kundu ( debarati@utexas.edu ) -- Graduate student, Dept. of ECE, UT Austin.
% Deepti Ghadiyaram ( deeptigp9@gmail.com ) -- Graduate student, Dept. of CS, UT Austin.
% Dr. Alan C. Bovik ( bovik@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
% Dr. Brian L. Evans ( bevans@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
% Kindly report any suggestions or corrections to Debarati Kundu (debarati@utexas.edu)
%
% Helper function to HIGRADE-1 model.

function feat = higrade_grad_log(imHDR)
feat1 = higrade_spatial(double(imHDR),2);
[Gmag, Gdir] = imgradient(imHDR);
feat2 = higrade_spatial(Gmag,2);
feat = [feat1 feat2];
end

