% Problem 1. Matrix operations
v = [9 5 10];
u = [4; 1; 3];
A = [1 2 5; 3 4 6];
B = [7 1 9; 2 2 3; 4 8 6];
C = [8 6 5; 1 -3 4; -1 -2 4];

% u(transpose) * u
question_1 = u' * u;
disp(question_1)

% u * u(transpose)
question_2 = u * u';
disp(question_2)

% v * u
question_3 = v * u;
disp(question_3)

% u + 5
question_4 = u + 5;
disp(question_4)

% A(transpose)
question_5 = A';
disp(question_5)

% B * u
question_6 = B * u;
disp(question_6)

% B(inverse)
question_7 = inv(B);
disp(question_7)

% B + C
question_8 = B + C;
disp(question_8)

% B - C
question_9 = B - C;
disp(question_9)

% A * B
question_10 = A * B;
disp(question_10)

% B * C
question_11 = B * C;
disp(question_11)

% B * A
% question_12 = B * A;
% disp(question_12)
% error is given


% Problem 2. Explanatory data analysis
T = readtable('pima.txt','Format', '%f%f%f%f%f%f%f%f%f');
% T.Properties.VariableNames = {'Times Pregnant', 'Plasma Glucose Concentration', 'Blood Pressure', 'Fold Thickness', 'Serum Insulin', 'Body Mass Index', 'Diabetes Pedigree', 'Age', 'Class Variable'};
A = table2array(T);
% (a)
min_table = min(A);
max_table = max(A);

% (b)
mean_table = mean(A);
std_table = std(A);

% (c)
label_0 = T(T.Var9==0,1:8);
table_0 = table2array(label_0);
mean_0 = mean(table_0);
std_0 = std(table_0);

label_1 = T(T.Var9==1,1:8);
table_1 = table2array(label_1);
mean_1 = mean(table_1);
std_1 = std(table_1);

% (g)
column_1 = A(:,1);
% histogram_analysis(column_1);
column_2 = A(:,2);
% histogram_analysis(column_2);
column_3 = A(:,3);
% histogram_analysis(column_3);
column_4 = A(:,4);
% histogram_analysis(column_4);
column_5 = A(:,5);
% histogram_analysis(column_5);
column_6 = A(:,6);
% histogram_analysis(column_6);
column_7 = A(:,7);
% histogram_analysis(column_7);
column_8 = A(:,8);
% histogram_analysis(column_8);

% (h)
class1_column1 = table_1(:,1);
class0_column1 = table_0(:,1);

class1_column2 = table_1(:,2);
class0_column2 = table_0(:,2);

class1_column3 = table_1(:,3);
class0_column3 = table_0(:,3);

class1_column4 = table_1(:,4);
class0_column4 = table_0(:,4);

class1_column5 = table_1(:,5);
class0_column5 = table_0(:,5);

class1_column6 = table_1(:,6);
class0_column6 = table_0(:,6);

class1_column7 = table_1(:,7);
class0_column7 = table_0(:,7);

class1_column8 = table_1(:,8);
class0_column8 = table_0(:,8);
%{
figure(1);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column1);
subplot(1, 2, 2);
histogram_analysis(class0_column1);

figure(2);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column2);
subplot(1, 2, 2);
histogram_analysis(class0_column2);

figure(3);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column3);
subplot(1, 2, 2);
histogram_analysis(class0_column3);

figure(4);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column4);
subplot(1, 2, 2);
histogram_analysis(class0_column4);

figure(5);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column5);
subplot(1, 2, 2);
histogram_analysis(class0_column5);

figure(6);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column6);
subplot(1, 2, 2);
histogram_analysis(class0_column6);

figure(7);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column7);
subplot(1, 2, 2);
histogram_analysis(class0_column7);

figure(8);
hold on;
subplot(1, 2, 1);
histogram_analysis(class1_column8);
subplot(1, 2, 2);
histogram_analysis(class0_column8);
%}

% (i)
test_attribute = scatter_plot(column_1, column_4);

% Problem 3. Data preprocessing
% (b)
normalize_3 = normalize(column_3);
% (c)
discretize_3 = discretize_attribute(column_3, 10);

% Problem 4. Splitting data into training and testing sets
% b
[training, testing] = divideset2(A, 0.66);
