% Mouhammadou Dabo (mod20)
% Problem Assignment 9

% Problem 3. Feature/Input ranking
% Part b.

function [AUC] = AUROC_score(x, y)
    [X, Y, T, AUC] = perfcurve(y, x, 1);
end