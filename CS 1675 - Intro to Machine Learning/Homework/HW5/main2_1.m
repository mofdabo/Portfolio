% Mouhammadou Dabo (mod20)
% Problem Assignment 5

% Problem 2.1. Exploratory data analysis
% (a)

% divide "pima.txt" data into two subsets
pima = importdata("pima.txt");

class_zero = pima(pima(:,9) == 0, :);
class_one = pima(pima(:,9) == 1, :);

for i = 1:8
    figure();
   
    subplot(1, 2, 1)
    histogram_analysis(class_zero(:,i));
    title("Class 0");
    
    subplot(1, 2, 2)
    histogram_analysis(class_one(:,i));
    title("Class 1");
    
    pause;
end

pause;
close all;


