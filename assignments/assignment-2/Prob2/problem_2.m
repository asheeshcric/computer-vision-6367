clear all;
clc;

img1 = imread('city1.jpg');
img2 = imread('city2.jpg');
img3 = imread('city3.jpg');

% Display the read images %
figure,
subplot(1, 3, 1);
imshow(img1);
subplot(1, 3, 2);
imshow(img2);
subplot(1, 3, 3);
imshow(img3);

img1 = im2double(img1);
img2 = im2double(img2);
img3 = im2double(img3);

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);
img3 = rgb2gray(img3);

[panaroma1] = create_panaroma(img1, img2);
[panaroma] = create_panaroma(panaroma1, img3);

figure, imshow(panaroma)
title('Composite Panaroma Image')
print('panaroma', '-dpng')
