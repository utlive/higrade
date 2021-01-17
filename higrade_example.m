% The investigators in this research are: 
% Debarati Kundu ( debarati@utexas.edu ) -- Graduate student, Dept. of ECE, UT Austin.
% Deepti Ghadiyaram ( deeptigp9@gmail.com ) -- Graduate student, Dept. of CS, UT Austin.
% Dr. Alan C. Bovik ( bovik@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
% Dr. Brian L. Evans ( bevans@ece.utexas.edu ) -- Professor, Dept. of ECE, UT Austin
% Kindly report any suggestions or corrections to Debarati Kundu (debarati@utexas.edu)
%
% This program tests the HIGRADE-1 and HIGRADE-2 models with LIBSVM
% binaries.

clc; clear all; close all;
addpath('ST_pub/');
imHDR = imread('H_Exploratorium_2_surreal.PNG');

%% HIGRADE-1 predictions
feat = higrade_1(imHDR);
feat(isnan(feat)) = 0;
fid = fopen('test_hdr.txt','w');
fprintf(fid,'1 ');
for kk = 1:length(feat)
    fprintf(fid,'%d:%f ',kk,feat(kk));
end
fprintf(fid,'\n'); 
fclose(fid);

delete output_hdr test_hdr.txt.Scaled dump_hdr
system(strcat(pwd,'/svm-scale -r hdrRange_higrade_1 test_hdr.txt >> test_hdr.txt.Scaled'));
system(strcat(pwd,'/svm-predict -b 1 test_hdr.txt.Scaled hdrScaled_higrade_1.txt.model output_hdr >> dump_hdr'));
load output_hdr;
fprintf('HIGRADE-1 predicted score: %f\n', output_hdr);


%% HIGRADE-2 predictions
feat = higrade_2(imHDR);
feat(isnan(feat)) = 0;
fid = fopen('test_hdr.txt','w');
fprintf(fid,'1 ');
for kk = 1:length(feat)
    fprintf(fid,'%d:%f ',kk,feat(kk));
end
fprintf(fid,'\n'); 
fclose(fid);

delete output_hdr test_hdr.txt.Scaled dump_hdr
system(strcat(pwd,'/svm-scale -r hdrRange_higrade_2 test_hdr.txt >> test_hdr.txt.Scaled'));
system(strcat(pwd,'/svm-predict -b 1 test_hdr.txt.Scaled hdrScaled_higrade_2.txt.model output_hdr >> dump_hdr'));
load output_hdr;
fprintf('HIGRADE-2 predicted score: %f\n', output_hdr);