% Problem 1. Linear regression
% Part 3.3. Online (stochastic) gradient descent
% (a)
% loads the train and test set
train = importdata("housing_train.txt");
test = importdata("housing_test.txt");

pgraph = init_progress_graph;

% Normalizes the x (input) part of both the train and test data.
train_attributes = train(:,1:13);
test_attributes = test(:,1:13);

[mean_norm, std_norm] = compute_norm_parameters(train_attributes);
norm_train = normalize(train_attributes, mean_norm, std_norm);
norm_test = normalize(test_attributes, mean_norm, std_norm);

norm_train_attributes = norm_train(:,1:13);
train_target = train(:,14);

norm_test_attributes = norm_test(:,1:13);
test_target = test(:,14);

% Implements the stochastic gradient descent procedure
oc_train = ones(size(norm_train, 1), 1);
oc_test = ones(size(norm_test, 1), 1);

x_train = [oc_train norm_train_attributes];
x_test = [oc_test norm_test_attributes];

n = size(train);
n = n(1);

w = ones(14, 1);

for i = 0:500
    index = mod(i, n) + 1;
    alpha = 2 / sqrt(i + 1);
    predict = LR_predict(x_train(index,:), w);
    w = w + alpha * (train_target(index) - predict) * x_train(index,:)';
    
    if(mod(i, 50) == 0)
        predict_train = LR_predict(x_train, w);
        predict_test = LR_predict(x_test, w);

        error_train = immse(predict_train, train_target);
        error_test = immse(predict_test, test_target);
        
        pgraph = add_to_progress_graph(pgraph, i, error_train, error_test);
    end
end

disp(w);

predict_train = LR_predict(x_train, w);
predict_test = LR_predict(x_test, w);

error_train = immse(predict_train, train_target)
error_test = immse(predict_test, test_target)