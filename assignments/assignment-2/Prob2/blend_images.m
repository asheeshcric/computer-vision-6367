function [blend] = blend_images(img1, img2, m1, m2)
    [h1, w1] = size(img1);
    [h2, w2] = size(img2);
    
    dif1 = (w2 - m2) - (w1 - m1);
    dif2 = m1 - m2;
    img1 = [img1, zeros(h1, dif1)];
    img2 = [zeros(h2, dif2), img2];
    
    m2 = m1;
    level = 5;
    lap_img1 = genPyr(img1, level); % the Laplacian pyramid
    lap_img2 = genPyr(img2, level);

    mask1 = zeros(size(img1));
    mask1(:,1:m1) = 1;
    mask2 = zeros(size(img2));
    mask2(:,m2:size(img2 ,2)) = 1;
    blurh = fspecial('gauss', 30, 15); % smoothen the border
    mask1 = imfilter(mask1, blurh, 'replicate');
    mask2 = imfilter(mask2, blurh, 'replicate');
    lap_img_o = cell(1,level); % the blended pyramid
    
    for p = 1:level
        [Mp, Np, ~] = size(lap_img1{p});
        mask1p = imresize(mask1, [Mp, Np]);
        mask2p = imresize(mask2, [Mp, Np]);
        lap_img_o{p} = lap_img1{p} .* mask1p + lap_img2{p} .* mask2p;
    end

    for p = length(lap_img_o)-1:-1:1
        lap_img_o{p} = lap_img_o{p}+pyr_expand(lap_img_o{p+1});
    end
    blend = lap_img_o{1};    
end

function [ pyr ] = genPyr( img, level )
    pyr = cell(1, level);
    pyr{1} = im2double(img);
    for p = 2:level
        pyr{p} = pyr_reduce(pyr{p-1});
    end

    for p = level-1:-1:1
        osz = size(pyr{p+1})*2-1;
        pyr{p} = pyr{p}(1:osz(1),1:osz(2),:);
    end

    for p = 1:level-1
        pyr{p} = pyr{p}-pyr_expand(pyr{p+1});
    end
end

function [ img_out ] = pyr_expand( img )

    kw = 5; % default kernel width
    cw = .375; % kernel centre weight
    ker1d = [.25-cw/2 .25 cw .25 .25-cw/2];
    kernel = kron(ker1d,ker1d')*4;

    % expand [a] to [A00 A01;A10 A11] with 4 kernels
    ker00 = kernel(1:2:kw,1:2:kw); % 3*3
    ker01 = kernel(1:2:kw,2:2:kw); % 3*2
    ker10 = kernel(2:2:kw,1:2:kw); % 2*3
    ker11 = kernel(2:2:kw,2:2:kw); % 2*2
    img = im2double(img);
    sz = size(img(:,:,1));
    osz = sz*2-1;
    img_out = zeros(osz(1),osz(2),size(img,3));
    for p = 1:size(img,3)
        img1 = img(:,:,p);
        img1ph = padarray(img1,[0 1],'replicate','both'); % horizontally padded
        img1pv = padarray(img1,[1 0],'replicate','both'); % horizontally padded

        img00 = imfilter(img1,ker00,'replicate','same');
        img01 = conv2(img1pv,ker01,'valid'); % imfilter doesn't support 'valid'
        img10 = conv2(img1ph,ker10,'valid');
        img11 = conv2(img1,ker11,'valid');

        img_out(1:2:osz(1),1:2:osz(2),p) = img00;
        img_out(2:2:osz(1),1:2:osz(2),p) = img10;
        img_out(1:2:osz(1),2:2:osz(2),p) = img01;
        img_out(2:2:osz(1),2:2:osz(2),p) = img11;
    end
end

function [ img_out ] = pyr_reduce( img )
    cw = .375; % kernel centre weight
    ker1d = [.25-cw/2 .25 cw .25 .25-cw/2];
    kernel = kron(ker1d,ker1d');
    img = im2double(img);
    sz = size(img);
    img_out = [];
    for p = 1:size(img,3)
        img1 = img(:,:,p);
        imgFiltered = imfilter(img1,kernel,'replicate','same');
        img_out(:,:,p) = imgFiltered(1:2:sz(1),1:2:sz(2));
    end
end
