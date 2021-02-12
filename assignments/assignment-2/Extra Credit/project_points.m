function [P_C] = project_points(P_W, R, T)

    a = 200;    % Scaling
    s = 0;      % Skew
    
    % Get the image center
    px = 50;
    py = 50;
    
    % Convert into homogeneous coordinates
    P_W = P_W';
    P_W = [P_W; ones(1, size(P_W, 2))];
    
    K = [a, s, px, 0;
         0, a, py, 0;
         0, 0, 1,  0];
    
    RM = [R, T];
    RM = [RM; 0, 0, 0, 1];
    
    P_C = K * RM * P_W;
    P_C = hom2cart(P_C')';
end

