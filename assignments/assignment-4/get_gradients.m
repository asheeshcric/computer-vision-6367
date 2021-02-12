function [grad_mag, grad_ang] = get_gradients(im_dx, im_dy, im)
    [height, width] = size(im_dx);
    grad_mag = im;
    grad_ang = im;
    
    for i=1:height
        for j=1:width
            grad_mag(i,j) = sqrt(im_dx(i,j)*im_dx(i,j) + im_dy(i,j)* im_dy(i,j));
            grad_ang(i,j) = atan2d(im_dy(i,j), im_dx(i,j));
            
            % Convert angle from radian to degrees
            if grad_ang(i,j)<0
                grad_ang(i,j) = grad_ang(i,j) + 180;
            end
            if grad_ang(i,j) == 180
                grad_ang(i,j) = 0;
            end
        end
    end
end