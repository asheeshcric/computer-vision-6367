function [feature] = get_tiny_image(I, output_size)
    w = output_size(1);
    h = output_size(2);
    % Resize image to the given output size using imresize%
    j = imresize(I, output_size);
    % Reshape using column order %
    b = reshape(j, [w*h, 1]);
    avg = mean(b);
    unit_length = sqrt(sum(b.*b));
    feature = (double(b)-avg)/unit_length;
end