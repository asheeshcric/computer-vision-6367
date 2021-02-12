clc;
clear all;
close all;

[confusion, accuracy] = classify_knn_tiny();
figure;
imagesc(confusion);
title('KNN Tiny Confusion Matrix');
disp('KNN Tiny Accuracy');
disp(accuracy);