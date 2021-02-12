clc;
clear all;
img = imread('umbrella_woman.jpg');
sigma = 2;
filtered_img = imgaussfilt(img, sigma);


[roberts_detector, r_direction] = roberts(filtered_img);
[sobel_detector, s_direction] = sobel(filtered_img);
[prewitt_detector, p_direction] = prewitt(filtered_img);

imshow(roberts_detector, []);
title('Roberts Edge Detector - Magnitude');

figure, imshow(r_direction, []);
title('Roberts Edge Detector - Direction');

figure, imshow(sobel_detector, []);
title('Sobel Edge Detector - Magnitude');

figure, imshow(s_direction, []);
title('Sobel Edge Detector - Direction');

figure, imshow(prewitt_detector, []);
title('Prewitt Compass Edge Detector - Magnitude');

figure, imshow(p_direction, []);
title('Prewitt Compass Edge Detector - Direction');