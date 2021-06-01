function [newdata] = subsample(data, k)
    msize = numel(data);
    i = randperm(msize);
    newdata = data(i(1:k));
end