function [mpts1, mpts2] = match_corners(img1,img2,pts1,pts2,w)

np1 = size(pts1, 1);
np2 = size(pts2, 1);


f = zeros(np1, 1);
g = zeros(np2, 1);
fm = zeros(np1, 1);
gm = zeros(np2, 1);

ncc = zeros(np1, np2);

for n = 1 : np1
    cx = pts1(n, 1);
    cy = pts1(n, 2);
    f(n, 1) = img1(cx, cy);
    fK = img1(cx - w : cx + w, cy - w : cy + w);
    fm(n, 1) = mean(fK(:));
end

for n = 1 : np2
    cx = pts2(n, 1);
    cy = pts2(n, 2);
    g(n, 1) = img2(cx, cy);
    gK = img2(cx - w : cx + w, cy - w : cy + w);
    gm(n, 1) = mean(gK(:));
end

ft = f - fm;
gt = g - gm;

fs = sum(ft.^2);
gs = sum(gt.^2);
denum = sqrt(fs*gs);

for n = 1 : np1
    for m = 1 : np2
        ncc(n, m) = (ft(n)*gt(m)) / denum;
    end
end

if (np1 <= np2)
    mpts1 = pts1;
    mpts2 = zeros(size(mpts1));
    for i = 1 : np1
        [~, ix] = max(ncc(i, :));
        mpts2(i, :) = pts2(ix, :);
    end
else
    mpts2 = pts2;
    mpts1 = zeros(size(mpts2));
    for i = 1 : np2
        [~, ix] = max(ncc(:, i));
        mpts1(i, :) = pts1(ix, :);
    end
end

end

