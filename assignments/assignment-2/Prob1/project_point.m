% Ashish Jaiswal - 1001748734 %

% 1(a) %

% Origin => [0, 0, 0] Camera Center at O %
% This function projects a point on the Image Plane H: z=1 %


function [Q] = project_point(P)
    % The point P is represented as homogeneous coordinate [a:b:c] % 
    a = P(1);
    b = P(2);
    c = P(3);
    
    % To find the projection of P on the plane H: %
    Q = zeros(1, 3);
    Q(1) = a/c;
    Q(2) = b/c;
    Q(3) = c/c;
end