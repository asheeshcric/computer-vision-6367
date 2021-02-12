function [confusion, accuracy] = classify_svm_bow()

    train_file = fopen('scene_classification_dataset/train.txt');
    label_path = fgetl(train_file);
    source_dir='scene_classification_dataset/';
    training_image_cell={};
    step_size=20;
    size_param=10;

    train_label=[];
    while ischar(label_path)
        space = isspace(label_path);
        idx = find(space~=0, 1, 'first');
        labelstring = extractBetween(label_path,1,idx-1);
        image_path=extractBetween(label_path,idx+1,length(space));
        image_path = replace(image_path, '\', '/');
        I=imread(strcat(source_dir,image_path{1}));
        training_image_cell{end+1}=I;
        [label]=encode_label(labelstring{1});
        train_label=[train_label;label];
        label_path = fgetl(train_file);
    end
    fclose(train_file);


    test_file = fopen('scene_classification_dataset/test.txt');
    label_path = fgetl(test_file);

    label_test=[];
    SIFT_feature_cell_test={};
    while ischar(label_path)
       % disp(label_path);
        space = isspace(label_path);
        idx = find(space~=0, 1, 'first');
        labelstring = extractBetween(label_path,1,idx-1);
        image_path=extractBetween(label_path,idx+1,length(space));
        image_path = replace(image_path, '\', '/');
        I=imread(strcat(source_dir,image_path{1}));
        [frames,descrs] = vl_dsift(single(I),'fast','step',step_size,'size',size_param);
        SIFT_feature_cell_test{end+1}=descrs';
        [label]=encode_label(labelstring{1});
        label_test=[label_test;label];  
        label_path = fgetl(test_file);
    end
    fclose(test_file);

    dic_size=50;
    [vocab] = build_visual_dictionary(training_image_cell, dic_size);
    SIFT_feature_cell_train=load('SIFT_feature_cell_train.mat');

    feature_train_BOW=[];
    feature_test_BOW=[];

    for i=1:size(SIFT_feature_cell_train.SIFT_feature_cell_train,2)
        [bow_feature]=compute_bow(SIFT_feature_cell_train.SIFT_feature_cell_train{1,i},vocab);
        feature_train_BOW=[feature_train_BOW;bow_feature];
    end


    for i=1:size(SIFT_feature_cell_test,2)
        [bow_feature]=compute_bow(SIFT_feature_cell_test{1,i},vocab);
        feature_test_BOW=[feature_test_BOW;bow_feature];
    end

    [label_test_pred]=predict_svm(feature_train_BOW,train_label, feature_test_BOW);
    confusion=confusionmat(label_test,label_test_pred);
    accuracy=(trace(confusion)/sum(sum(confusion)))*100;

end