clc;

clear all;
close all;

im = imread('einstein.jpg');
im = im2double(im);

figure, imshow(im);
title('Original Image');
hold off;

[hog] = HOG(im);