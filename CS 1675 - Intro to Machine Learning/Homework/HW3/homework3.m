% Problem 1. Multivariate Gaussian
% a
G = importdata('gaussian.txt');

col_1 = G(:,1);
col_2 = G(:,2);

figure()
scatter(col_1, col_2);
hold on
title("Gaussian.txt")
hold off

% b
mean_gaussian = mean(G);
covariance_gaussian = cov(G);

x1 = -5:0.25:15;
x2 = -5:0.25:15;
[X1, X2] = meshgrid(x1, x2);
X = [X1(:) X2(:)];

y = mvnpdf(X, mean_gaussian, covariance_gaussian);
y = reshape(y, length(x2), length(x1));

figure()
surf(x1, x2, y);
hold on
xlabel('x1');
ylabel('x2');
zlabel('Probability Density');
hold off

% c
N = size(G);
N = N(1);

mean_1 = mean(col_1)
var_1 = var(col_1)
mean_col_1 = sum(col_1)/N;
difference_1 = col_1 - mean_col_1;
ml_variance_1 = sum(difference_1.^2)/(N - 1);

x1 = -15:0.1:20;
dis_1 = normpdf(x1, mean_col_1, ml_variance_1);

figure()
plot(x1, dis_1)
hold on
plot([mean_col_1 mean_col_1], [0 max(dis_1)])
title("Column 1")
hold off

mean_2 = mean(col_2)
var_2 = var(col_2)
mean_col_2 = sum(col_2) / N;
difference_2 = col_2 - mean_col_2;
ml_variance_2 = sum(difference_2.^2)/(N - 2);

x2 = -15:0.1:30;
dis_2 = normpdf(x2, mean_col_2, ml_variance_2);

figure()
plot(x2, dis_2)
hold on
plot([mean_col_2 mean_col_2], [0 max(dis_2)])
title("Column 2")
hold off

% Problem 2. Poisson distribution
% (a)
range_1 = 0:10;
lambda_2 = poisspdf(range_1, 2);

figure()
scatter(range_1, lambda_2);
hold on
title("Poission Lambda = 2")
hold off

range_2 = 0:20;
lambda_6 = poisspdf(range_2, 6);

figure()
scatter(range_2, lambda_6);
hold on
title("Poission Lambda = 6")
hold off

% (b)
P = importdata('poisson.txt');

N_2 = size(P);
N_2 = N_2(1);

ml_estimate_p = sum(P)/N_2;
lambda_ml = poisspdf(P, ml_estimate_p);
figure()
scatter(P, lambda_ml)
hold on
title("Poisson.txt")
hold off

% (c)
range_3 = 0:0.1:50;

gamma_1 = gampdf(range_3, 1, 2);
gamma_2 = gampdf(range_3, 3, 5);

figure()
plot(range_3, gamma_1)
hold on
plot(range_3, gamma_2)

title("Gamma Distribution Prior")
legend("a = 1, b = 2", "a = 3, b = 5")
hold off

% (d)
P_sorted = sort(P);
gamma_3 = gampdf(P_sorted, 1, 2);
gamma_4 = gampdf(P_sorted, 3, 5);

figure()
plot(P_sorted, gamma_3)
hold on
plot(P_sorted, gamma_4)

title("Gamma Distribution Posterior")
legend("a = 1, b = 2", "a = 3, b = 5")
hold off 

% Problem 3. Non-parametric density estimation
% Part 1
N = importdata('NDE_data.txt');
T = importdata('NDE_test.txt');

figure()
histogram(N, 20)
hold on
title("NDE Data")
hold off

% Part 2
% (a)
X = [0:0.01:1];
densities = zeros(size(X));

for i = 1:length(X)
    density_x = Parzen_window(X(i), 0.025, N);
    densities(i) = density_x;
end

densities_test = zeros(size(X));
for i = 1:length(X)
    density_test_x = Parzen_window(X(i), 0.025, T);
    densities(i) = density_test_x;
end

figure()
plot(X, densities)
hold on
scatter(X, densities_test)
title("Parzen Window with h = 0.025")
hold off

% (b)
densities_2 = zeros(size(X));

for i = 1:length(X)
    density_x = Parzen_window(X(i), 0.1, N);
    densities_2(i) = density_x;
end

figure()
plot(X, densities_2)
hold on
title("Parzen Window with h = 0.1")
hold off

% Part 3
% (a)
densities_3 = zeros(size(X));

for i = 1:length(X)
    density_x = kNN(X(i), 3, N);
    densities_3(i) = density_x;
end

figure()
plot(X, densities_3)
hold on
title("kNN with k = 3")
hold off

% (b)
densities_4 = zeros(size(X));

for i = 1:length(X)
    density_x = kNN(X(i), 5, N);
    densities_4(i) = density_x;
end

figure()
plot(X, densities_4)
hold on
title("kNN with k = 5")
hold off