% Ashish Jaiswal 
% 1001748734
% Assignment 5 - CSE-6367

clear all;
close all;
clc;

imgL = rgb2gray(im2double(imread('officeL.png')));
imgR = rgb2gray(im2double(imread('officeR.png')));

figure, imshow(imgL), title('Left Office Image');
figure, imshow(imgR), title('Right Office Image');

% Intrinsic Parameters from Extra Credit using the calibration files %
Kl = [742.33151   0           0;
      0           758.24496   0         
      397.25962   206.56216   1];
Kl = Kl';

Kr = [528.64586   0           0;
      0           590.79207   0         
      430.69284   188.87239   1];
Kr = Kr';
  
Rl = [ 0.10,  0.99,  0.06, -147.75 ;
       0.98, -0.09, -0.10, -146.79 ;
      -0.09,  0.07,	-0.99,  913.71];
  
Rr = [ 0.14,  0.97,  0.18, -242.3 ;
       0.96, -0.09, -0.25, -139.0 ;
      -0.22,  0.21,	-0.95,  903.3];

% Camera Matrices %
Pl = Kl * Rl;
Pr = Kr * Rr;


[imgRectL, imgRectR] = rectify_images(imgL, imgR, Pl, Pr);

figure, imshow(imgRectL)
title('Rectified Left Image')
print('rectL', '-dpng')

figure, imshow(imgRectR)
title('Rectified Right Image')
print('rectR', '-dpng')

dispSSD = compute_corrs(imgRectL, imgRectR, 'SSD');
figure, imshow(dispSSD)
title('Disparity SSD')
print('dispSSD', '-dpng')
 
dispCC = compute_corrs(imgL, imgR, 'CC');
figure, imshow(dispCC)
title('Disparity CC')
print('dispCC', '-dpng')
 
dispNCC = compute_corrs(imgRectL, imgRectR, 'NCC');
figure, imshow(dispNCC)
title('Disparity NCC')
print('dispNCC', '-dpng')

% cloud is [height x width x 2]
% cloud [:,:,3] = grayscale value
% cloud [:,:,1] = depth value
cloud = depth2cloud(imgL, dispSSD);
figure, imshow(cloud)
title('3D point cloud')
print('cloud', '-dpng')


