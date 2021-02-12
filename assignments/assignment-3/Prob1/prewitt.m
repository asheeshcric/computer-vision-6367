function [output, direction] = prewitt(img)
    img = double(img);
    height = size(img, 1);
    width = size(img, 2);
    channels = size(img, 3);
    output = img;
    direction = img;
    
    % Two kernels used for Prewitt Compass Edge Detector (0 and 45 degrees)%
    Gx = [-1 +1 +1; -1 -2 +1; -1 +1 +1];
    Gy = [+1 +1 +1; -1 -2 +1; -1 -1 +1];
    
    for i = 2:height-1
        for j = 2:width-1
            for k = 1:channels
                tempOutput = img(i - 1 : i + 1, j - 1 : j + 1, k);
                a = (sum(Gx.* tempOutput));
                x = sum(a);
                
                b = (sum(Gy.* tempOutput));
                y = sum(b);
                pixValue = max(x, y);
                pixDirection = atan(y/x);
                output(i, j, k) = pixValue;
                direction(i, j, k) = pixDirection;
            end
        end
    end
    
    output = uint8(output);
    % Apply a threhold to the direction array to make it more clear %
    direction = apply_threshold(direction, -1, 1);
end