function [train, test] = kfold_crossvalidation(data, k, m)
    train = [];
    test = [];
    i = 1;
    
    add_1 = mod(length(data), k);
    per_group = floor(length(data)/k);
    sizes = zeros(k,1);
    for j = 1:k
        if add_1 > 0
            sizes(j) = per_group + 1;
            add_1 = add_1 - 1;
        else
            sizes(j) = per_group;
        end
    end
    
    for n = 1:k
        if n == m
            test = [test, data(i: i + sizes(n) - 1)];
        else
            train = [train, data(i: i + sizes(n) - 1)];
        end
        i = i + sizes(n);
    end
end