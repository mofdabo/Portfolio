% Mouhammadou Dabo (mod20)
% Problem Assignment 10

% Problem 1. Bagging and Boosting

% Function to calculate the average error

function [average_error] = find_average(train_target, train_predict, test_target, test_predict)
    train_missed = find(train_target ~= train_predict);
    test_missed = find(test_target ~= test_predict);

    train_error = size(train_missed, 1)/size(train_target, 1);
    test_error = size(test_missed,1)/size(test_target,1);
    average_error = [train_error, test_error];
end