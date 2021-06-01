% Mouhammadou Dabo (mod20)
% Problem Assignment 10

% Problem 1. Bagging and Boosting

% Part b.

function [test_y] = DT_base_full(tr_x, tr_y, test_x, params)
    tree = fitctree(tr_x, tr_y, 'MaxNumSplits', 25, 'MinParentSize', 10, 'MinLeafSize', 2, 'splitcriterion', 'gdi', 'Prune', 'off');
    test_y = predict(tree, test_x);
end