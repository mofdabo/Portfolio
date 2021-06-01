% Mouhammadou Dabo (mod20)
% Problem Assignment 6

% Problem 1. Support vector machines

% Part b.
function [y] = apply_svml(x, w, b)
    if w'*x'+b >= 0
        y = 1;
    else
        y = 0;
    end
end