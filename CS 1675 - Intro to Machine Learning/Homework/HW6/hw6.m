% Mouhammadou Dabo (mod20)
% Problem Assignment 6

% Problem 1. Support vector machines

% Part a.
train = importdata("pima_train.txt");
test = importdata("pima_test.txt");

train_attributes = train(:,1:8);
train_target = train(:,9);

test_attributes = test(:,1:8);
test_target = test(:,9);

cost = 1;

[w, b] = svml(train_attributes, train_target, cost)

% Part c.
decisions_train = zeros(size(train_attributes, 1), 1);

for i = 1:length(decisions_train)
    decisions_train(i) = apply_svml(train_attributes(i,:), w, b);
end

N_train = size(decisions_train, 1);
C_train = confusionmat(train_target, decisions_train);
C_train = C_train./N_train

TN_train = C_train(1, 1);
FP_train = C_train(1, 2);
FN_train = C_train(2, 1);
TP_train = C_train(2, 2);

E_train = FP_train + FN_train
SN_train = TP_train / (TP_train + FN_train)
SP_train = TN_train / (TN_train + FP_train)

decisions_test = zeros(size(test_attributes, 1), 1);

for i = 1:length(decisions_test)
    decisions_test(i) = apply_svml(test_attributes(i,:), w, b);
end

N_test = size(decisions_test, 1);
C_test = confusionmat(test_target, decisions_test);
C_test = C_test./N_test

TN_test = C_test(1, 1);
FP_test = C_test(1, 2);
FN_test = C_test(2, 1);
TP_test = C_test(2, 2);

E_test = FP_test + FN_test
SN_test = TP_test / (TP_test + FN_test)
SP_test = TN_test / (TN_test + FP_test)

% Problem 2. ROC analysis
% Part b.
[X, Y, T, AUC] = perfcurve(test_target, w'*test_attributes'+b, 1);
plot(X, Y);
xlabel('False positive rate');
ylabel('True positive rate');
title('ROC Curve for SVM Model');

message = ["AUC = " + num2str(AUC)];
disp(message);














