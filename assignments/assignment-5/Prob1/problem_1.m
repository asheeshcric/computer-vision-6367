% Ashish Jaiswal 
% 1001748734
% Assignment 5 - CSE-6367

clear all;
clc;

% Load Data from .mat files
P  = load('pts_world.mat', 'P').P;
pl = load('pts_viewL.mat', 'pl').pl;
pr = load('pts_viewR.mat', 'pr').pr;

% (a) Compute instrinsic and translation parameters of the camera %
[Kl, Tl, Kr, Tr] = compute_stereo_calib(P, pl, pr);

% (b) Estimate the location of corresponding points in the left camera
% frame
[P_hat] = get_world_points(pl, pr, P);

% Errors
err = (P_hat - P).^2;
err = sum(err, 2);
err = sqrt(err);

min_err = min(err);
max_err = max(err);
err_mean = mean(err);
err_std = std(err);

% disp(num2str(Kl));
% disp(num2str(Tl));
% disp(num2str(Kr));
% disp(num2str(Tl));

% disp(num2str(err));
disp('Min Error');
disp(num2str(min_err));
disp('Max Error');
disp(num2str(max_err));
disp('Error Mean');
disp(num2str(err_mean));
disp('Error Std');
disp(num2str(err_std));
