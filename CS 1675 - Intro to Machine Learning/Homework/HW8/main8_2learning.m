% Mouhammadou Dabo (mod20)
% Problem Assignment 8

% Problem 2. Pneumonia diagnosis

% Part a.
function [pneumonia, fever, paleness, cough, highWBCcount] = main8_2learning()
    data = importdata('pneumonia.tex');
    features = size(data,2);
    num_rows = size(data,1);

    true_data = find(data(:,features));
    pneumonia_true = mean(data(true_data,:));

    false_data = find(data(:,features)==0);
    pneumonia_false = mean(data(false_data,:));

    fever = [pneumonia_true(1), 1 - pneumonia_true(1); pneumonia_false(1), 1 - pneumonia_false(1)];
    paleness = [pneumonia_true(2), 1 - pneumonia_true(2); pneumonia_false(2), 1 - pneumonia_false(2)];
    cough = [pneumonia_true(3), 1 - pneumonia_true(3); pneumonia_false(3), 1 - pneumonia_false(3)];
    highWBCcount = [pneumonia_true(4), 1 - pneumonia_true(4); pneumonia_false(4), 1 - pneumonia_false(4)];

    pneumonia = [size(true_data,1)/num_rows, size(false_data,1)/num_rows];
end
