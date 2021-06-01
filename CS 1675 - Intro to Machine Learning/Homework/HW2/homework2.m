% Problem 1. Mean estimates and the effect of the sample size
% Part 1
fileID = fopen('mean_study_data.txt');
A = fscanf(fileID,'%e');

mean_table = mean(A);
std_table = std(A);

% Part 3
mean_subsample = zeros(1000,1);

for i = 1:1000
    my_sample = subsample(A, 25);
    mean_sample = mean(my_sample);
    mean_subsample(i) = mean_sample;
end

h_mean = histogram(mean_subsample, 20);

% Part 4
mean_h = mean(mean_subsample);

% Part 5
mean_subsample_2 = zeros(1000,1);

for i = 1:1000
    my_sample_2 = subsample(A, 40);
    mean_sample_2 = mean(my_sample_2);
    mean_subsample_2(i) = mean_sample_2;
end

mean_h_2 = mean(mean_subsample_2);
h_mean_2 = histogram(mean_subsample_2, 20);

% Part 6
first_25 = A(1:25);
mean_first_25 = mean(first_25);

disp('Our null hypothesis: The true mean 15 does fall within the 0.95 CI generated from the first 25 examples')

ci = ttest(first_25, 15);
if ci == 1
    disp('The null hypothesis is NOT rejected: the true mean does fall within the 0.95 CI')
else
    disp('The null hypothesis is rejected: the true mean does not fall within the 0.95 CI')
end

% Problem 2. k-fold cross-validation
% (Part 2)
fileID = fopen('resampling_data.txt');
C = fscanf(fileID,'%f');

for i = 1:10
    [train, test] = kfold_crossvalidation(C, 10, i);
    to_print = sprintf('Test %d . Mean: %f, STD: %f', i, mean(test), std(test));
    disp(to_print);
end

% Problem 6. Bernoulli trials
% (a)
fileID = fopen('coint.txt');
B = fscanf(fileID,'%e');
total_0 = sum(B==0);
total_1 = sum(B==1);

ml_estimate = total_1/(total_0 + total_1);

% (b)
x = 0:.01:1;

prior = betapdf(x, 1, 1);
plot(x, prior)

hold on

posterior = betapdf(x, 66, 36); 
plot(x, posterior)

% (c)
map_estimate = (total_1 + 1 - 1) / (total_1 + total_0 + 1 + 1 - 2)
xline(map_estimate)

hold off

% (d)

x_2 = 0:.01:1;

prior_2 = betapdf(x_2, 4, 2);
plot(x_2, prior_2)

hold on

posterior_2 = betapdf(x_2, 69, 37); 
plot(x_2, posterior_2)

      
map_estimate_2 = (total_1 + 4 - 1) / (total_1 + total_0 + 4 + 2 - 2)
xline(map_estimate_2)

hold off

