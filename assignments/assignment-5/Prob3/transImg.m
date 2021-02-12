function [imgT] = transImg(img, T)
    [nr, nc] = size(img);
    imgT = zeros(nr, nc);

    R = abs(T(1:2, 1:2));
    Tr = T(1:2, 3);

    for i = 1 : nr
        for j = 1 : nc
            ij = (R * [i; j])';
            jj = j;
            if (Tr(1)<0)
                jj = jj + round(Tr(1)/2); 
            end
            ii = i;
            if ( (ii <= nr) && (ii >= 1) && (jj <= nc) && (jj >= 1))
                imgT(ii, jj) = img(i, j);
            end
        end
    end
end

