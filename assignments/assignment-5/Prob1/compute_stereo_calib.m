% Ashish Jaiswal 
% 1001748734
% Assignment 5 - CSE-6367
function [Kl,Tl,Kr,Tr] = compute_stereo_calib(P,pl,pr)
    % Computes the intrinsic and translational parameters for both left
    % and right camera frames based on the world points %
    num_points = size(P, 1);
    P = [P, ones(num_points, 1)];

    % For the left image
    H = zeros(2 * num_points, 12);

    for i = 1:num_points
        H((i-1)*2+1, 1:4) = P(i, :);
        H(i*2, 5:8) = P(i, :);
        H((i-1)*2+1, 9:12) = -pl(i, 1) * P(i, :);
        H(i*2, 9:12) = -pl(i, 2) * P(i, :);
    end

    % Applying Vector Decomposition
    [V, D] = eig(H' * H);
    e = zeros(1, size(D, 1));

    for i = 1:size(D, 1)
        e(i) = D(i, i);
    end

    [~, min_i] = min(e);
    m = V(:, min_i);
    M = [m(1:4)';m(5:8)';m(9:12)'];
    a1 = M(1, 1:3);
    a2 = M(2, 1:3);
    a3 = M(3, 1:3);
    l = 1 / norm(a3, 1);
    r3 = (l*a3)';
    u0 = l*l*dot(a1, a3);
    v0 = l*l*dot(a2, a3);
    alpha = l*l*norm(cross(a1, a3), 1);
    beta = l*l*norm(cross(a2, a3), 1);

    A = M(:, 1:3);
    b = M(:, 4);
    a1 = A(1, :)';
    a2 = A(2, :)';
    a3 = A(3, :)';
    cosTheta = -dot(cross(a1, a3),cross(a2, a3)) / (norm(cross(a1, a3), 2)*norm(cross(a2, a3), 2));
    r1 = cross(a2, a3)/norm(cross(a2, a3), 2);
    r2 = cross(r3, r1);

    Kl = [alpha, 0,      u0; 
          0      beta,   v0;
          0,     0,      1];
    T = l * (b\inv(Kl));
    R = [r1'; r2'; r3'];

    Tl = [R, T'];
    Tl = [Tl; 0 0 0 1];

    % For the Right Image
    H = zeros(2 * num_points, 12);

    for i = 1 : num_points
        H((i-1)*2+1, 1:4) = P(i, :);
        H(i*2, 5:8) = P(i, :);
        H((i-1)*2+1, 9:12) = -pr(i, 1) * P(i, :);
        H(i*2, 9:12) = -pr(i, 2) * P(i, :);
    end

    % Vector Decomposition
    [V, D] = eig(H' * H);
    e = zeros(1, size(D,1));

    for i = 1:size(D,1)
        e(i) = D(i,i);
    end

    [~, min_i] = min(e);
    m = V(:, min_i);
    M = [m(1:4)';m(5:8)';m(9:12)'];
    a1 = M(1, 1:3);
    a2 = M(2, 1:3);
    a3 = M(3, 1:3);
    l = 1 / norm(a3, 1);
    r3 = (l*a3)';
    u0 = l*l*dot(a1, a3);
    v0 = l*l*dot(a2, a3);
    alpha = l*l*norm(cross(a1, a3),1);
    beta = l*l*norm(cross(a2, a3), 1);

    A = M(:,1:3);
    b = M(:,4);
    a1 = A(1,:)';
    a2 = A(2,:)';
    a3 = A(3,:)';
    cosTheta = -dot(cross(a1, a3), cross(a2, a3))/(norm(cross(a1, a3), 2)*norm(cross(a2, a3), 2));
    r1 = cross(a2, a3)/norm(cross(a2, a3), 2);
    r2 = cross(r3, r1);

    Kr = [alpha, 0,      u0; 
          0      beta,   v0;
          0,     0,      1];
    T = l * (b\inv(Kr));
    R = [r1'; r2'; r3'];

    Tr = [R, T'];
    Tr = [Tr; 0 0 0 1];

end