clc;
clear all;
close all;


[confusion, accuracy] = classify_knn_bow();
figure;
imagesc(confusion);
title('KNN Bow Confusion Matrix');
disp('KNN Bow Accuracy');
disp(accuracy);