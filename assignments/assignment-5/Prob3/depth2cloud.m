function [cloud] = depth2cloud(img, D)
    [nr, nc] = size(img);

    cloud = zeros(nr, nc, 3);

    for i = 1 : nr
        for j = 1 : nc
            cloud(i, j, 3) = img(i, j);
            cloud(i, j, 1) = D(i, j);

        end
    end
end

