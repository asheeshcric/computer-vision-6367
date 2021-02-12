function [confusion, accuracy] = classify_knn_tiny()

    fid_train = fopen('scene_classification_dataset/train.txt');
    tline = fgetl(fid_train);
    pre='scene_classification_dataset/';
    output_size=[16 16];
    feature_train=[];
    label_train=[];
    while ischar(tline)
        space = isspace(tline);
        idx = find(space~=0, 1, 'first');
        labelstring = extractBetween(tline,1,idx-1);
        imagestring=extractBetween(tline,idx+1,length(space));
        imagestring = replace(imagestring, '\', '/');
        I=imread(strcat(pre,imagestring{1}));
        [feature] = get_tiny_image(I,output_size);
        feature_train=[feature_train;feature'];
        [label]=encode_label(labelstring{1});
        label_train=[label_train;label];
        tline = fgetl(fid_train);
    end
    fclose(fid_train);



    fid_test = fopen('scene_classification_dataset/test.txt');
    tline = fgetl(fid_test);
    tline = replace(tline, '\', '/');
    feature_test=[];
    label_test=[];

    while ischar(tline)
       % disp(tline);
        space = isspace(tline);
        idx = find(space~=0, 1, 'first');
        labelstring = extractBetween(tline,1,idx-1);
        imagestring=extractBetween(tline,idx+1,length(space));
        imagestring = replace(imagestring, '\', '/');
        I=imread(strcat(pre,imagestring{1}));
       [feature] = get_tiny_image(I,output_size);
       feature_test=[feature_test;feature'];
        [label]=encode_label(labelstring{1});
        label_test=[label_test;label];  
        tline = fgetl(fid_test);
    end
    fclose(fid_test);


     k=5;
    [label_test_pred]=predict_knn(feature_train,label_train, feature_test,k);
    confusion=confusionmat(label_test,label_test_pred);
    accuracy=(trace(confusion)/sum(sum(confusion)))*100;
end