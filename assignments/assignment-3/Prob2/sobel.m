function [output] = sobel(img)
    img = double(img);
    height = size(img, 1);
    width = size(img, 2);
    channels = size(img, 3);
    output = img;
    direction = img;
    
    % Kernels for Sobel Edge Detector %
    Gx = [-1 0 +1; -2 0 +2; -1 0 +1];
    Gy = [1 +2 +1; 0 0 0; -1 -2 -1];
    
    for i = 2:height-1
        for j = 2:width-1
            for k = 1:channels
                tempOutput = img(i-1:i + 1, j-1:j+1, k);
                a = (sum(Gx.* tempOutput));
                x = sum(a);
                
                b = (sum(Gy.* tempOutput));
                y = sum(b);
                pixValue = sqrt(x.^2+ y.^2);
                pixDirection = atan(y/x);
                output(i, j, k) = pixValue;
                direction(i, j, k) = pixDirection;
            end
        end
    end
    
    output = uint8(output);
end