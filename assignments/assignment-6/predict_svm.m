function [label_test_pred] = predict_svm(feature_train, label_train, feature_test)

    %lambda = 0.00001 ;
    rng(1);
    all_scores=[];
    for i=1:15
        B = label_train == i;
        eachlabel = ones(length(label_train),1);
        eachlabel(B==0) = -1;
        svm_model = fitcsvm(feature_train,eachlabel,'Standardize',true,'KernelFunction','RBF',...
        'KernelScale','auto');
       [label,score] = predict(svm_model,feature_test);
       all_scores = [all_scores;score(:,2)'];

    end

    [M, I] = max(all_scores);
    label_test_pred = I';
end