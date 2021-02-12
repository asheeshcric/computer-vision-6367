clear all;
clc;

img = imread('zelda.png');
gray_img = im2double(img);


[U,S,V] = svd(gray_img);
S2 = S;
N=2000;

figure, subplot(1, 5, 1);
imshow(gray_img);
title('Original Gray Image:');

m = 1;
for N = [3, 10, 20, 40]
    S2 = S;
    S2(N+1:end,:) = 0;
    S2(:,N+1:end) = 0;
    D = sqrt(S2);
    C = U*D*D*V';
    subplot(1, 5, m+1);
    imshow(C);
    title(['Top Singular Values: ', num2str(N)]);
    m = m + 1;
    size(C)
end

error = S-C;
