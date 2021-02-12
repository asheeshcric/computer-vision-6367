function [panorama] = create_panorama2(img_left, img_right)
    thresh = 0.2;
    [pts_left] = extract_corners(img_left, thresh);
    [pts_right] = extract_corners(img_right, thresh);
    [mpts_left, mpts_right] = match_corners(img_left, img_right, pts_left, pts_right, 7);

    H = compute_homography(mpts_left, mpts_right);
    
    hmpts_right = [mpts_right; ones(1, size(mpts_right, 2))];
    hmpts_right = H * hmpts_right;
    hmpts_right = hmpts_right ./ hmpts_right(3,:);
    mpts_right = hmpts_right(1:2, :);
    mask1 = int32(max(mpts_left(1,:)));
    mask2 = int32(max(mpts_right(1,:)));
    
    panorama = blend_images(img_left, img_right, mask1, mask2); 
end

