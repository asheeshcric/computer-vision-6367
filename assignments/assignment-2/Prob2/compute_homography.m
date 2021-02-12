function [H] = compute_homography(pts1, pts2)
    % Computing homography using DLT algorithm %
    nPts = size(pts1, 2);
    A = zeros(2*nPts, 9);

    for i = 1 : nPts
        x1 = pts1(1, i);
        y1 = pts1(2, i);
        x2 = pts2(1, i);
        y2 = pts2(2, i);
        
        A(2*i-1, :) = [-x1, -y1, -1, 0, 0, 0, x2*x1, x2*y1, x2];
        A(2*i, :) = [0, 0, 0, -x1, -y1, -1, y2*x1, y2*y1, y2];
    end

    [~, ~, V] = svd(A);
    h = V(:, 9);
    H = reshape(h, [3, 3]);

end