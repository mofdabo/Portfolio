% Mouhammadou Dabo (mod20)
% Problem Assignment 4

% Problem 1. Linear regression
% Part 3.1. Exploratory data analysis

% (b)
housing = importdata("housing.txt");
N = size(housing);
N = N(2);

attributes = ["CRIM", "ZN", "INDUS", "CHAS", "NOX", "RM", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B", "LSTAT", "MEDV"];

target = housing(:,14);
for i = 1:N-1
    fprintf("Correlation of Column %d with Column 14", i);
    col = housing(:,i);
    corrcoef(col, target)
end

% (c)

for i = 1:N-1
    figure(i)
    col = housing(:,i);
    scatter_plot(col, target)
    pause;
end

pause;
close all;

% (d)
for i = 1:N
    for j = (i + 1):N-1
        first_col = housing(:,i);
        second_col = housing(:,j);
        correlation = corrcoef(first_col, second_col);
        to_print = sprintf("Correlation between %s and %s = %f\n", attributes(i), attributes(j), correlation(1,2)); 
        disp(to_print);
    end
end
