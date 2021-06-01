function [train_img, train_label, test_img, test_label] = data_loader(data_direction)
    data_types = {'train', 'test'};
    for t = 1:length(data_types)
       clear mat;
       clear labels;
       type = string(data_types(t));
       folder_dir = strcat(data_direction, '/', type);
       folders = dir(folder_dir);
       dfolders = folders([folders(:).isdir]);
       dfolders = dfolders(~ismember({dfolders(:).name},{'.','..'}));
       ind = 1;
       for i = 1: length(dfolders)
           path = strcat(dfolders(i).folder, '/', dfolders(i).name);
           F = dir(fullfile(path,'*.pgm'));
           for k = 1:numel(F)
               mat(:, :, ind) = imread(fullfile(path, F(k).name));
               labels(ind) = str2num(dfolders(i).name);
               ind = ind + 1;
           end
       end
       if data_types(t) == "train"
            train_img_temp = mat(:, :, :);
            train_img=vectorize(train_img_temp);
            train_label = labels(:);
       elseif data_types(t) == "test"
            test_img_temp = mat(:, :, :);
            test_img=vectorize(test_img_temp);
            test_label = labels(:);
       end
    end
end
