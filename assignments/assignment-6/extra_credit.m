clc;
clear all;
close all;

[confusion, accuracy] = classify_svm_bow();
figure;
imagesc(confusion);
title('SVM Bow Confusion Matrix');
disp('SVM Bow Accuracy');
disp(accuracy);