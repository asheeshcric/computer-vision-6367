function [im_dx, im_dy] = filter_image(im)
    [height, width] = size(im);
    im_padded = zeros(height+2, width+2);
    
    % Copy the image to the padded version
    for i=1:height
        for j=1:width
            im_padded(i+1, j+1) = im(i, j);
        end
    end
    
    im_dx = zeros(height, width);
    im_dy = zeros(height, width);
    
    % Kernels for gradients in x and y direction
    kernelX = [1,0,-1;1,0,-1;1,0,-1];
    kernelY = [1,1, 1; 0,0,0; -1,-1,-1];
    for i=2:height+1
        for j=2:width+1
            im_dx(i-1, j-1) = sum(sum(kernelX .* im_padded(i-1:i+1, j-1:j+1)));
            im_dy(i-1, j-1) = sum(sum(kernelY .* im_padded(i-1:i+1, j-1:j+1)));
        end
    end
end