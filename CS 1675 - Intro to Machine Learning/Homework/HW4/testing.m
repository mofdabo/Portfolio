% Problem 1. Linear regression
% Part 3.3. Online (stochastic) gradient descent
% (c)
% loads the train and test set
train = importdata("housing_train.txt");
test = importdata("housing_test.txt");

pgraph = init_progress_graph;

train_attributes = train(:,1:13);
test_attributes = test(:,1:13);

% Normalizes the x (input) part of both the train and test data.
[mean_norm_train, std_norm_train] = compute_norm_parameters(train_attributes);
norm_train = normalize(train_attributes, mean_norm_train, std_norm_train);
norm_test = normalize(test_attributes, mean_norm_train, std_norm_train);

train_attributes = norm_train(:,1:13);
train_target = train(:,14);

test_attributes = norm_test(:,1:13);
test_target = test(:,14);

% Implements the stochastic gradient descent procedure
oc_train = ones(size(norm_train, 1), 1);

x_train = [train_attributes, oc_train];

n = size(norm_train);
n = n(1);

w = ones(14, 1);

for i = 0:1000
    index = mod(i, n) + 1;
    alpha = 0.01;
    predict = LR_predict(x_train(index,:), w);
    w = w + alpha * (train_target(index) - predict) * x_train(index,:)';
    
    if(mod(i, 50) == 0)
        predict_train = LR_predict(train_attributes, w(1:13));
        predict_test = LR_predict(test_attributes, w(1:13));

        error_train = immse(predict_train, train_target);
        error_test = immse(predict_test, test_target);
        
        pgraph = add_to_progress_graph(pgraph, i, error_train, error_test);
    end
end

disp(w);

predict_train = LR_predict(train_attributes, w(1:13));
predict_test = LR_predict(test_attributes, w(1:13));

error_train = immse(predict_train, train_target)
error_test = immse(predict_test, test_target)




