% Mouhammadou Dabo (mod20)
% Problem Assignment 5

% Problem 2.2. Learning of the Naive Bayes classifier
% (a)

function [p, prior_zero] = main2_2()
    train = importdata("pima_train.txt");

    % 0 is exponential, 1 is normal
    class_conditionals = [0 1 1 1 0 1 0 0];

    class_zero = train(train(:,9) == 0, :);
    class_one = train(train(:,9) == 1, :);

    p = cell(2, 8);
    prior_zero = size(class_zero) / (size(class_zero) + size(class_one)); 
    
    for i = 1:8
        if(class_conditionals(i) == 0)
            p{1, i} = expfit(class_zero(:,i));
            p{2, i} = expfit(class_one(:,i));
        else
            [mu_zero, sigma_zero] = normfit(class_zero(:,i));
            p{1, i} = [mu_zero, sigma_zero];
            [mu_one, sigma_one] = normfit(class_one(:,i));
            p{2, i} = [mu_one, sigma_one]; 
        end
    end
end