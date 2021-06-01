% Problem 1. Linear regression
% Part 3.3. Online (stochastic) gradient descent
% (b)
% loads the train and test set
train = importdata("housing_train.txt");
test = importdata("housing_test.txt");

train_attributes = train(:,1:13);
test_attributes = test(:,1:13);

train_target = train(:,14);
test_target = test(:,14);

% Implements the stochastic gradient descent procedure
oc_train = ones(size(norm_train, 1), 1);
oc_test = ones(size(norm_test, 1), 1);

x_train = [oc_train train_attributes];
x_test = [oc_test test_attributes];

n = size(train);
n = n(1);

w = ones(14, 1);

for i = 0:1000
    index = mod(i, n) + 1;
    alpha = 0.05 / (i + 1);
    predict = LR_predict(x_train(index,:), w);
    w = w + alpha * (train_target(index) - predict) * x_train(index,:)';
end

disp(w);

predict_train = LR_predict(x_train, w);
predict_test = LR_predict(x_test, w);

error_train = immse(predict_train, train_target)
error_test = immse(predict_test, test_target)