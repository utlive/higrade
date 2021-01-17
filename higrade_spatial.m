% The investigators in this research are: 
% Debarati Kundu ( debarati@utexas.edu ) -- Graduate student, Dept. of ECE, UT Austin.
% Deepti Ghadiyaram ( deeptigp9@gmail.com ) -- Graduate student, Dept. of CS, UT Austin.
% Dr. Alan C. Bovik ( bovik@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
% Dr. Brian L. Evans ( bevans@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
% Kindly report any suggestions or corrections to Debarati Kundu (debarati@utexas.edu)
%
% Helper function to HIGRADE models.

function para = higrade_spatial(im, scale_num)
if(size(im,3)~=1)
    im = (double(rgb2gray(im)));
else
    im = double(im);
end

window = fspecial('gaussian',7,7/6);
window = window/sum(sum(window));

para = [];
for scale = 1:scale_num
    para_spt = spatial_feature(im, window);
    para = [para para_spt];    
    im = imresize(im, 0.5);
end

function ggdpara = spatial_feature(im, window)

ggdpara = [];
shifts = [0 1;1 0 ; 1 1; -1 1];

mu = filter2(window, im, 'same');
mu_sq = mu.*mu;
sigma = sqrt(abs(filter2(window, im.*im, 'same') - mu_sq));
structdis = (im-mu)./(sigma+1);

sigmaParam  = nakafit(sigma(:)+eps);
%sigmaParam  = gamfit(sigma(:)+eps);
ggdpara = [ggdpara sigmaParam(1) sigmaParam(2)]; 

[sigma_tmp alpha_tmp] = gaussian_para_esti(structdis(:));
ggdpara_tmp = [sigma_tmp alpha_tmp];
ggdpara = [ggdpara ggdpara_tmp];
structdis = log(abs(structdis) + .1);

for itr_shift = 1:4
    structdis_shift_tmp = circshift(structdis, shifts(itr_shift,:));
    structdis_diff = structdis - structdis_shift_tmp;
    [sigma_tmp alpha_tmp] = gaussian_para_esti(structdis_diff(:));
    ggdpara_tmp = [sigma_tmp alpha_tmp];
    ggdpara = [ggdpara ggdpara_tmp];
    structdis_shift(itr_shift) = {[structdis_shift_tmp]};
end
structdis_diff = structdis + structdis_shift{1,3} - structdis_shift{1,1} - structdis_shift{1,2};
[sigma_tmp_0 alpha_tmp_0] = gaussian_para_esti(structdis_diff(:));
ggdpara_tmp_0 = [sigma_tmp_0 alpha_tmp_0];
    
win_tmp_1 = [0 1 0; -1 0 -1; 0 1 0;];
win_tmp_2 = [1 0 -1; 0 0 0; -1 0 1;];
structdis_diff_1 = filter2(win_tmp_1, structdis, 'same');
structdis_diff_2 = filter2(win_tmp_2, structdis, 'same');
[sigma_tmp_1 alpha_tmp_1] = gaussian_para_esti(structdis_diff_1(:));
[sigma_tmp_2 alpha_tmp_2] = gaussian_para_esti(structdis_diff_2(:));
ggdpara_tmp_1 = [sigma_tmp_1 alpha_tmp_1];
ggdpara_tmp_2 = [sigma_tmp_2 alpha_tmp_2];
    
ggdpara = [ggdpara ggdpara_tmp_0 ggdpara_tmp_1 ggdpara_tmp_2];



