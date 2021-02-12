function [output, direction] = roberts(img)
    img = double(img);
    height = size(img, 1);
    width = size(img, 2);
    channels = size(img, 3);
    output = img;
    direction = img;
    
    % Kernels for Roberts Cross Edge Detector %
    Gx = [+1 0; 0 -1];
    Gy = [0 +1; -1 0];
    
    for i = 1:height-1
        for j = 1:width-1
            for k = 1:channels
                tempOutput = img(i:i + 1, j:j + 1, k);
                a = (sum(Gx.* tempOutput));
                x = sum(a);
                
                b = (sum(Gy.* tempOutput));
                y = sum(b);
                % Roberts and Sobel only differ with the kernels %
                pixValue = sqrt(x.^2+ y.^2);
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