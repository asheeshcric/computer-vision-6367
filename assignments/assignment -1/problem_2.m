clear all;
clc;

img = imread('board.tif');
img = im2double(img);
img_size = size(img)
subplot(1, 2, 1), imshow(img)
title('Original Image')

% ----- (a) ------ %
% Extract the rectangular block of the image between (200, 90) and (300, 180) %
% block_img = img(90:180-1, 200:300-1, :);
block_img = img(200:300, 90:180, :);
block_img_size = size(block_img)
subplot(1, 2, 2), imshow(block_img)
title('Crystal')


% ----- (b) ------ %

    % ------(i) ------ %
disp('Gray 1:')
tic
block_gray_1 = zeros(block_img_size(1), block_img_size(2), 1);
for i = 1:block_img_size(1)
    for j = 1:block_img_size(2)
        for k = 1:3
            block_gray_1(i,j) = (block_img(i,j,1) + block_img(i,j,2) + block_img(i,j,3))/3;
        end
    end
end
toc

    % ------(ii) ------ %
disp('Gray 2:')
tic
block_gray_2 = (block_img(:,:,1) + block_img(:,:,2) + block_img(:,:,3))/3;
toc


    % ------(iii) ------ % 
disp('Gray 3:')
tic
block_gray_3 = rgb2gray(block_img);
toc


% ------(c) ------ %
% Converting grayscale image to a binary image using mean as the threshold value %

threshold = mean(block_gray_3(:));

    % ------(i) ------ %
disp('BW 1:')
tic
block_bw_1 = zeros(size(block_gray_1, 1), size(block_gray_1, 2), 1);
for i = 1:size(block_gray_1, 1)
    for j = 1:size(block_gray_1, 2)
        block_bw_1(i,j) = double(block_gray_1(i,j) > threshold);
    end
end
toc

    % ------(ii) ------ %
disp('BW 2:')
tic
block_bw_2 = double(block_gray_2 > threshold);
toc

     % ------(iii) ------ %
disp('BW 3:')
tic
block_bw_3 = im2bw(block_gray_3);
toc


figure,
subplot(1, 2, 1)
imshow(block_gray_1)
title('Grayscale Image of the block (i)')

subplot(1, 2, 2)
imshow(block_bw_1)
title('Binary Image of the block (i)')

print('Gray and BW with method (i)', '-dpng')


figure,
subplot(1, 2, 1)
imshow(block_gray_2)
title('Grayscale Image of the block (ii)')

subplot(1, 2, 2)
imshow(block_bw_2)
title('Binary Image of the block (ii)')

print('Gray and BW with method (ii)', '-dpng')



figure,
subplot(1, 2, 1)
imshow(block_gray_3)
title('Grayscale Image of the block (iii)')

subplot(1, 2, 2)
imshow(block_bw_3)
title('Binary Image of the block (iii)')

print('Gray and BW with method (iii)', '-dpng')



% --------------------------------(d) ----------------------------------- %
% Smoothing of the gray image formed above %

    % ----- (i) ----- Using for loops%
disp('Smoothing Image using loops: ')
tic
gray_img = block_gray_3;
smoothed_image = zeros(size(gray_img));
kernel = 7;
pad = int8((kernel-1)/2);

% First zero pad gray_img by 3 pixels (pad) in each side (to apply convolution at edges) %
gray_img = [zeros(size(gray_img, 1), pad), gray_img, zeros(size(gray_img, 1), pad)];
gray_img = [zeros(pad, size(gray_img, 2)); gray_img; zeros(pad, size(gray_img, 2))];


for i = 1:size(smoothed_image, 1)
    for j = 1:size(smoothed_image, 2)
        sum = 0;
        for k = -pad:pad
            for l = -pad:pad
                sum = sum + gray_img(i+pad+k, j+pad+l);
            end
        end
        smoothed_image(i,j) = sum/(kernel^2);
    end
end
toc

figure, subplot(1, 2, 1)
imshow(smoothed_image)
title('Smoothed Image (i)')
print('Convolution (i)', '-dpng')

    % ----- (ii) ----- Using Matlab function conv2 %
disp('Smoothing image using conv2 (ii):')
tic
gray_img = block_gray_3;
filter = 1/(kernel^2) * ones(kernel, kernel);
smoothed_image = conv2(gray_img, filter, 'same');
toc

subplot(1, 2, 2), imshow(smoothed_image)
title('Smoothed Image (ii)')
print('Convolution (ii) - conv2', '-dpng')



