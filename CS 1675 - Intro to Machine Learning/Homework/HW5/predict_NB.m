% Mouhammadou Dabo (mod20)
% Problem Assignment 5

% Problem 2.3. Classification with the Naive Bayes model
% (a)

function [y] = predict_NB(x)
    g0 = zeros(size(x));
    g1 = zeros(size(x));
    y = zeros(size(x, 1), 1);
    
    [p, prior_zero] = main2_2();
    prior_one = 1 - prior_zero;
    
    n = size(x, 2);
    
    for i = 1:n-1
        % if it is exponential (check if there is a value at that cell)
        if (size(p{1,i}, 2) == 1) 
            mu0 = p{1,i};
            mu1 = p{2,i};
            g0(:,i) = exppdf(x(:,i), mu0);
            g1(:,i) = exppdf(x(:,i), mu1);
        % if it is normal
        else
            temp0 = p{1,i};
            temp1 = p{2,i};
            g0(:,i) = normpdf(x(:,i),temp0(1), temp0(2));
            g1(:,i) = normpdf(x(:,i),temp1(1), temp1(2));
        end
    end
    
    g0(:,9) = sum(log(g0(:,1:8)), 2) + log(prior_zero);
    g1(:,9) = sum(log(g1(:,1:8)), 2) + log(prior_one);
    
    for m = 1:size(x)
        if(g0(m,9) < g1(m,9))
            y(m) = 1;
        end    
    end
end
