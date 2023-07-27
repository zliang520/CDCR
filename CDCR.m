clear; close all; clc;
addpath('./tools/lz_tools');

workpath = './Test/';
savepath = './Test-CDCR/';
file_name = dir(fullfile(workpath,'*.png'));

for num = 1: length(file_name)
    tmp_name = file_name(num).name;
    im_name = [workpath,file_name(num).name];
    image = imread(im_name);
    tic;
    result = underwater_lz(image);  
    result = gc_lz(result);
     toc;
    im_name_out = [savepath,tmp_name(1:end-4),'',tmp_name(end-3:end)];
    imwrite(result,im_name_out);
    disp(num);
    %     pause(0.1);
end
