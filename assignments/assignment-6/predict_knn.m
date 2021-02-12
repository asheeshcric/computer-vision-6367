function [label_test_pred] = predict_knn(feature_train, label_train, feature_test, k)
    model = fitcknn(feature_train, label_train, 'NumNeighbors', k, 'Standardize', 1);
    [label_test_pred] = predict(model, feature_test);
end