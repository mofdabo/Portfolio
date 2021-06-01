% Mouhammadou Dabo (mod20)
% Problem Assignment 9

% Problem 3. Feature/Input ranking
% Part a.

function [score] = Fisher_score(x, y)
    positive = x(find(y==1));
    negative = x(find(y==0));
    
    score = ((mean(positive) - mean(negative))^2 / (std(positive)^2 + std(negative)^2));
end