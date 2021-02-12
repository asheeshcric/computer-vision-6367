function [output] = apply_threshold(direction, t1, t2)
    direction = max(direction, t1);
    direction(direction ~= t1) = 0;
    direction(direction == t1) = 255;

    direction = max(direction, t2);
    direction(direction ~= t2) = 255;
    direction(direction == t2) = 0;
    
    output = direction;
end