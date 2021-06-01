% X is the attributes
% y is the target attribute
function w = gradient_descent(X, y)
    n = size(X);
    n = n(1);

    w = ones(size(X, 2), 1);

    for i = 0:1000
        index = mod(i, n) + 1;
        alpha = 0.05 / (i + 1);
        predict = LR_predict(X(index,:), w);
        w = w + alpha * (y(index) - predict) * X(index,:)';
    end
end