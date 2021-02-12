clear all;
clc;

line_img = imread("lines.png");
line_img = rgb2gray(line_img);

xe = sobel(line_img);
figure, imshow(xe)
title('Image Edges Using Sobel Operator')
print('edge', '-dpng')

% rho & theta
rho = 1:3:sqrt((size(xe,1))^2+(size(xe,2))^2);
theta = -90:0.5:90-1;

%Voting
H = zeros(length(rho),length(theta)); 
[yIndex, xIndex] = find(xe); % find x,y of edge pixels

for i = 1:numel(xIndex)
    tetaIndex = 0;
    for teta = theta * pi / 180
        tetaIndex = tetaIndex + 1;
        roi = xIndex(i) * cos(teta) + yIndex(i) * sin(teta);
        if roi >= 1 && roi <= rho(end)
            t = abs(roi-rho);
            tmin = min(t);
            pIndex = find(t == tmin);
            pIndex = pIndex(1);
            H(pIndex,tetaIndex) = H(pIndex,tetaIndex) + 1;
        end
    end
end

[lines] = findlines(xe, H, theta, rho, 10, 100, 32, 100);

figure, imshow(xe), hold on
title('Hough Transform Output')

for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','green');

end

print('output', '-dpng')
