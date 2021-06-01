% Mouhammadou Dabo (mod20)
% Problem Assignment 5

% Problem 2.3. Classification with the Naive Bayes model
% (b)

function [] = main2_3()
    train = importdata('pima_train.txt');
    test = importdata('pima_test.txt');
    
    train_target = train(:,9);
    test_target = test(:,9);
    
    % statistics for the training data
    predict_train = predict_NB(train);
    
    N_train = size(predict_train, 1);
  
    % confusion matrix for training data
    C_train = confusionmat(train_target, predict_train);
    C_train = C_train./N_train

    % misclassification error for train
    FP_train = C_train(1, 2);
    FN_train = C_train(2, 1);
   
    E_train = FP_train + FN_train
    
    % statistics for the testing data
    predict_test = predict_NB(test);
    
    N_test = size(predict_test, 1);
    
    C_test = confusionmat(test_target, predict_test);
    C_test = C_test./N_test

    % misclassification error for test
    TN_test = C_test(1, 1);
    FP_test = C_test(1, 2);
    FN_test = C_test(2, 1);
    TP_test = C_test(2, 2);

    E_test = FP_test + FN_test
    SN_test = TP_test / (TP_test + FN_test)
    SP_test = TN_test / (TN_test + FP_test)
end