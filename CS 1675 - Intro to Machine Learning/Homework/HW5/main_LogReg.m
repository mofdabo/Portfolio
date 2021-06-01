% Mouhammadou Dabo (mod20)
% Problem Assignment 5

% Problem 1. Logistic regression model
% (b)

% load the training and testing data
train = importdata("pima_train.txt");
test = importdata("pima_test.txt");

% normalize inputs
train_attributes = train(:,1:8);
test_attributes = test(:,1:8);

[mean_norm, std_norm] = compute_norm_parameters(train_attributes);
norm_train = normalize(train_attributes, mean_norm, std_norm);
norm_test = normalize(test_attributes, mean_norm, std_norm);

train_target = train(:,9);
test_target = test(:,9);

% run gradient descent on the training dataset for 2000 epochs
w = Log_regression(norm_train, train_target, 2000);

% confusion matrix for train
col_ones_train = ones(size(norm_train, 1), 1);
norm_train = horzcat(col_ones_train, norm_train);   

alter_train = norm_train * w;

N_train = size(alter_train);
N_train = N_train(1);

for i = 1:N_train
    if alter_train(i) > 0
        alter_train(i) = 1;
    else
        alter_train(i) = 0;
    end
end

C_train = confusionmat(train_target, alter_train);
C_train = C_train./N_train
% disp(C_train)

% misclassification error for train
TN_train = C_train(1, 1);
FP_train = C_train(1, 2);
FN_train = C_train(2, 1);
TP_train = C_train(2, 2);

E_train = FP_train + FN_train
% SN_train = TP_train / (TP_train + FN_train)
% SP_train = TN_train / (TN_train + FP_train)

% confusion matrix for test
col_ones_test = ones(size(norm_test, 1), 1);
norm_test = horzcat(col_ones_test, norm_test);   

alter_test = norm_test * w;

N_test = size(alter_test);
N_test = N_test(1);

for i = 1:N_test
    if alter_test(i) > 0
        alter_test(i) = 1;
    else
        alter_test(i) = 0;
    end
end

C_test = confusionmat(test_target, alter_test);
C_test = C_test./N_test
% disp(C_test);

% misclassification error for test
TN_test = C_test(1, 1);
FP_test = C_test(1, 2);
FN_test = C_test(2, 1);
TP_test = C_test(2, 2);

E_test = FP_test + FN_test
SN_test = TP_test / (TP_test + FN_test)
SP_test = TN_test / (TN_test + FP_test)

[X, Y, T, AUC] = perfcurve(test_target, norm_test*w+b, 1);
plot(X, Y);
xlabel('False positive rate')
ylabel('True positive rate')
title('ROC Curve for Logistic Regression')

message = ["AUC = " + num2str(AUC)];
disp(message);
