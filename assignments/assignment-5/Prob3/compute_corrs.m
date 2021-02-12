function [disp] = compute_corrs(img_left, img_right, method)

    % Methods: SSD, CC, NCC
    [nr, nc] = size(img_left);

    disp = zeros(nr, nc);

    w = 7;

    if (method == "SSD" )
        for i = 1 : nr - w
            for j = 1 : nc - w
                dis_win = (img_left(i:i+w, j:j+w) - img_right(i:i+w, j:j+w)).^2;
                disp(i, j) = sum(dis_win(:));
            end
        end 
    end

    if (method == "CC" )
        for i = 1 : nr - w
            for j = 1 : nc - w
                dis_win = (img_left(i:i+w, j:j+w) .* img_right(i:i+w, j:j+w)).^2;
                disp(i, j) = sum(dis_win(:));
            end
        end 
    end

    if (method == "NCC" )
        for i = 1 : nr - w
            for j = 1 : nc - w
                dis_win = (img_left(i:i+w, j:j+w) .* img_right(i:i+w, j:j+w)).^2;
                dis_l = (img_left(i:i+w, j:j+w) .* img_left(i:i+w, j:j+w)).^2;
                dis_r = (img_right(i:i+w, j:j+w) .* img_right(i:i+w, j:j+w)).^2;
                disp_norm = sqrt(sum(dis_l(:)) * sum(dis_r(:)));
                disp(i, j) = sum(dis_win(:)) / disp_norm;
            end
        end 
    end
    
end

