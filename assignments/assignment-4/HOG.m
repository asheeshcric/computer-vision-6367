function [hog] = HOG(im)
    
    % Image Filtering (to get im_dx, im_dy) %
    [im_dx, im_dy] = filter_image(im);
    figure, subplot(1, 2, 1);
    imshow(im_dx);
    title('Gradient in X');
    subplot(1, 2, 2);
    imshow(im_dy);
    title('Gradient in Y');
    hold off;
    
    % Gradient Magnitude and Angle Computation (grad_mag, grad_ang) %
    [grad_mag, grad_ang] = get_gradients(im_dx, im_dy, im);
    figure, subplot(1, 2, 1);
    imagesc(grad_mag);
    title('Gradient Magnitudes');
    subplot(1, 2, 2);
    imagesc(grad_ang);
    title('Gradient Angles');
    hold off;
    
    % Orientation Binning %
    cell_size = 8;
    [ori_histo] = build_histogram(grad_mag, grad_ang, cell_size);
    
    
    % Block Normalization %
    block_size = 2;
    [ori_histo_normalized] = get_block_descriptor(ori_histo, block_size);
    size(ori_histo_normalized)
    
    hog = zeros(size(ori_histo_normalized,1)*size(ori_histo_normalized,2)*size(ori_histo_normalized,3),1);
    dim3=size(ori_histo_normalized,3);
    k=1;
    for i=1: size(ori_histo_normalized,1)
        for j=1: size(ori_histo_normalized,2)
            temp = permute(ori_histo_normalized(i,j,:),[3 2 1]);
            hog((k-1)*dim3 +1: dim3*k)=temp;
            k=k+1;

        end
    end
    
    % Plot HOG features over the original image %
    figure;
    imshow(im);
    hold on;
    title('HOG Visualized');
    visualize_hog(ori_histo, im);
    
end