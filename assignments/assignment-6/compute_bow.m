function [bow_feature] = compute_bow(feature, vocab)
    idx = knnsearch(double(vocab), double(feature));
    histo = histcounts(idx,'BinLimits',[1, size(vocab,1)], 'BinMethod','integers');
    bow_feature = histo/norm(histo);
end