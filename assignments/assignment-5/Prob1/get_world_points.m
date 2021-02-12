% Ashish Jaiswal 
% 1001748734
% Assignment 5 - CSE-6367
function [P_hat] = get_world_points(pl, pr, P)
    % This function estimates the location of corresponding world points in
    % the left camera frame %

    % Get the camera parameters for using the left frame
    [~, ~, K, T] = compute_stereo_calib(P, pl, pr);

    proj = K * T(1:3, :);

    inv_proj = pinv(proj);

    P_hat = inv_proj * pl';

    % Converting to inhomogeneous
    P_hat = P_hat';
    P_hat = P_hat ./ P_hat(:, 4);
    P_hat = P_hat(:, 1:3) * 1e-3;
end

