% Mouhammadou Dabo (mod20)
% Problem Assignment 10

% Problem 1. Bagging and Boosting

% Part c.
train = importdata('hw10_train.txt');
test = importdata('hw10_test.txt');

train_x = train(:,1:65);
train_y = train(:,66);

test_x = test(:,1:65);
test_y = test(:,66);

bagging_error = zeros(10, 2);
boosting_error = zeros(10, 2);

for i = 1:10
    for j = 1:20
       train_error = Bag_classifier(train_x, train_y, train_x, sprintf('[@DT_base_simple, %d, []]', i));
       test_error = Bag_classifier(train_x, train_y, test_x, sprintf('[@DT_base_simple, %d, []]', i));
       average_error = find_average(train_y, train_error, test_y, test_error);
       bagging_error(i,:) = bagging_error(i,:) + average_error;

       train_error = Boost_classifier(train_x, train_y, train_x, sprintf('[@DT_base_simple, %d, []]', i));
       test_error = Boost_classifier(train_x, train_y, test_x, sprintf('[@DT_base_simple, %d, []]', i));
       average_error = find_average(train_y, train_error, test_y, test_error);
       boosting_error(i,:) = boosting_error(i,:) + average_error;
    end
end

bagging_error = bagging_error./20;
boosting_error = boosting_error./20;

figure()
plot(bagging_error)

figure()
plot(boosting_error)