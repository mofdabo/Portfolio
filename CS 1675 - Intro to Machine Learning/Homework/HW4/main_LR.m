% Problem 1. Linear regression
% Part 3.2. Linear regression
% (c)
% loads the train and test set
train = importdata("housing_train.txt");
test = importdata("housing_test.txt");

train_attributes = train(:,1:13);
train_target = train(:,14);

test_attributes = test(:,1:13);
test_target = test(:,14);

% learns the weights of the linear regression model from the training data
% prints the weights of the model

w = LR_solve(train_attributes, train_target);
disp(w);

% applies the model to both the training and testing data, and computes the
% mean squared error on the training and testing data set

predict_train = LR_predict(train_attributes, w);
predict_test = LR_predict(test_attributes, w);

error_train = immse(predict_train, train_target)
error_test = immse(predict_test, test_target)

