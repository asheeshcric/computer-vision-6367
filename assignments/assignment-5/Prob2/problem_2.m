% Ashish Jaiswal 
% 1001748734
% Assignment 5 - CSE-6367

clear all;
clc;

% Loading Images
left_img = imread('viewL.png');
right_img = imread('viewR.png');
left_img = im2double(left_img);
left_img = rgb2gray(left_img);
right_img = im2double(right_img);
right_img = rgb2gray(right_img);

L = load('disparity.mat', 'L');
disp_gt = im2double(L.L);

profile on;

tic
    [disp_ssd] = compute_corrs(left_img, right_img, "SSD");
toc
figure, imshow(disp_ssd);
title('SSD Disparity Map');
print('disp_ssd', '-dpng')

err_ssd = sqrt((disp_gt - disp_ssd).^2);
min_err_ssd = min(err_ssd(:));
max_err_ssd = max(err_ssd(:));
mean_err_ssd = mean(err_ssd(:));
std_err_ssd = std(err_ssd(:));

tic
    [disp_cc] = compute_corrs(left_img, right_img, "CC");
toc
figure, imshow(disp_cc);
title('CC Disparity Map');
print('disp_cc', '-dpng')

err_cc = sqrt((disp_gt - disp_cc).^2);
min_err_cc = min(err_cc(:));
max_err_cc = max(err_cc(:));
mean_err_cc = mean(err_cc(:));
std_err_cc = std(err_cc(:));

tic
    [disp_ncc] = compute_corrs(left_img, right_img, "NCC");
toc
figure, imshow(disp_ncc);
title('NCC Disparity Map');
print('disp_ncc', '-dpng')

err_ncc = sqrt((disp_gt - disp_ncc).^2);
min_err_ncc = min(err_ncc(:));
max_err_ncc = max(err_ncc(:));
mean_err_ncc = mean(err_ncc(:));
std_err_ncc = std(err_ncc(:));

disp(num2str(min_err_ssd));

profile report
profile off