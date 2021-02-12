function [label] = encode_label(label_name)    
    % Encode label names to integers %
    flag = strcmp(label_name,'Kitchen');
    if(flag==1)
        label=1;
    end

    flag = strcmp(label_name,'Store');
    if(flag==1) 
        label=2;
    end

    flag = strcmp(label_name,'Bedroom');
    if(flag==1)
        label=3;
    end

    flag = strcmp(label_name,'LivingRoom');
    if(flag==1)
        label=4;
    end

    flag = strcmp(label_name,'Office');
    if(flag==1)
        label=5;
    end

    flag = strcmp(label_name,'Industrial');
    if(flag==1)
        label=6;
    end


    flag = strcmp(label_name,'Suburb');
    if(flag==1)
        label=7;
    end

    flag = strcmp(label_name,'InsideCity');
    if(flag==1)
        label=8;
    end


    flag = strcmp(label_name,'TallBuilding');
    if(flag==1)
        label=9;
    end

    flag = strcmp(label_name,'Street');
    if(flag==1)
        label=10;
    end

    flag = strcmp(label_name,'Highway');
    if(flag==1)
        label=11;
    end

    flag = strcmp(label_name,'OpenCountry');
    if(flag==1)
        label=12;
    end

    flag = strcmp(label_name,'Coast');
    if(flag==1)
        label=13;
    end

    flag = strcmp(label_name,'Mountain');
    if(flag==1)
        label=14;
    end

    flag = strcmp(label_name,'Forest');
    if(flag==1)
        label=15;
    end
end