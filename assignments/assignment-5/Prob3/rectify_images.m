function [rectL, rectR] = rectify_images(imgL, imgR, Pl, Pr)
    au = norm(cross(Pl(1,1:3)', Pl(3,1:3)'));
    av = norm(cross(Pl(2,1:3)', Pl(3,1:3)'));

    % Opt Center
    cl = - inv(Pl(:, 1:3)) * Pl(:, 4);
    cr = - inv(Pr(:, 1:3)) * Pr(:, 4);

    fl = Pl(3, 1:3)';
    fr = Pr(3, 1:3)';
    nn = cross(fl, fr);

    % Solving
    A = [cl', 1  ;
         cr', 1  ;
         nn', 0];

    [U, S, V] = svd(A);
    r = 1/(norm(V(1:3, 4)));
    a3 = r * V(:, 4);

    A = [cl', 1  ;
         cr', 1  ;
         a3(1:3)', 0];
    [U, S, V] = svd(A);
    r = norm(av)/(norm(V(1:3, 4)));
    a2 = r * V(:, 4);

    A = [cl', 1  ;
         a2(1:3)', 1  ;
         a3(1:3)', 0];
    [U, S, V] = svd(A);
    r = norm(au)/(norm(V(1:3, 4)));
    a1 = r * V(:, 4);

    A = [cr', 1  ;
         a2(1:3)', 1  ;
         a3(1:3)', 0];
    [U, S, V] = svd(A);
    r = norm(au)/(norm(V(1:3, 4)));
    b1 = r * V(:, 4);

    H = eye(3);

    % Rectified P Matrices
    rectPl = H * [a1, a2, a3]';
    rectPr = H * [b1, a2, a3]';

    % Image Transformations
    TransL = rectPl(1:3, 1:3) / (Pl(1:3, 1:3));
    TransR = rectPr(1:3, 1:3) / (Pr(1:3, 1:3));

    rectL = transImg(imgL, TransL);
    rectR = transImg(imgR, TransR);

end