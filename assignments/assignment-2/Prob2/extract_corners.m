function [pts] = extract_corners(img, thresh)
% Finding Gradients
[Gx,Gy] = imgradientxy(img);
Gx2 = Gx .^ 2;
Gy2 = Gy .^ 2;
Gxy = Gx .* Gy;

% Gaussian filter 'g'
gaus = fspecial('gaussian', 7, 2);

Gx2 = imfilter(Gx2, gaus);
Gy2 = imfilter(Gy2, gaus);
Gxy = imfilter(Gxy, gaus);

R = zeros(size(img, 1), size(img, 2));
H = zeros(size(img, 1), size(img, 2));

% Harris Detector
for i = 1 : size(img, 1)
   for j = 1 : size(img, 2)
       M = [Gx2(i, j) Gxy(i, j); Gxy(i, j) Gy2(i, j)];
       R(i, j) = det(M) - 0.04 * (trace(M) ^ 2);
   end
end

for i = 1 : size(img, 1)
   for j = 1 : size(img, 2)
       if (R(i, j) > thresh)
          H(i, j) = R(i, j);
       end
   end
end


% Non Maximal Supression 
output = H > imdilate(H, [1 1 1; 1 0 1; 1 1 1]);

[px, py] = find(output == 1);
pts = [px, py];

i = 1;
while (i <= size(pts, 1))
    if ( (pts(i,1)<10) || (pts(i,2)<10))
        pts(i,:) = [];
    else
        i = i + 1;
    end
end