function [ori_histo_normalized] = get_block_descriptor(ori_histo, block_size)
    [M, N, cell_size] = size(ori_histo);
    e = 0.001;
    ori_histo_normalized = zeros(M-1, N-1, cell_size*block_size*block_size);
    
    
    for i=1:M-block_size+1
        for j=1:N-block_size+1
            features = zeros(1, 1, cell_size*block_size*block_size);
            k = 1;
            for p = 1:block_size
                for q = 1:block_size
                    holder = ori_histo(i+p-1, j+q-1, :);
                    features(1, 1, (k-1)*cell_size+1:cell_size*k) = holder(:);
                    k = k+1;
                end
            end
            features_norm = features/sqrt(sum(features .* features) + e*e);
            ori_histo_normalized(i,j,:) = features_norm;
        end
    end
end