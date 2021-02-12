clc;
clear all;

img = imread('abc.jpg');
img = rgb2gray(img);

figure; imhist(img);
title('Image Histogram - My Image');

% Get threshold for the image using Otsu's Automatic Image Thresholding Algorithm
thres = otsu(img)

% Separate foreground and background using the threshold
thresholded_img = imbinarize(img, thres/255);
figure; imshow(thresholded_img); 
title('Thresholded Image - My Image');