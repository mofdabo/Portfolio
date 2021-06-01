% Mouhammadou Dabo (mod20)
% Problem Assignment 9

% Problem 1. K-means clustering

% Part a.
[s, d] = k_means(3);

% Part b.
[s, d] = k_means(4);

% Part c.
[s, d] = k_means(4)

% Part d.

sizes = [];
distances = [];
for i = 1:30
    [s, d] = k_means(4);
    sizes = [sizes;s];
    distances = [distances;d];
end

[min, i] = min(distances)


% Problem 2. Hierarchical clustering
Y = importdata('clustering_data.txt');

% Part a.
Z = linkage(Y, 'complete', 'euclidean');
% dendrogram(Z, 0);

% Part b.
C = cluster(Z, 'maxclust', 4);

sizes = [];

figure();
hold on
for i = 1:4
    data = Y(find(C==i),:);
    sizes = [sizes, size(data,1)];
    scatter(data(:,1), data(:,2), 'filled');
    hold on
end
hold off

disp(sizes)

%Problem 3. Feature/Input ranking
feature_data = importdata('FeatureSelectionData.txt');

% Part a.
scores_f = zeros(70, 1);
for i=1:70
    scores_f(i) = Fisher_score(feature_data(:,i), feature_data(:,71));
end

[sorted_f, index_f] = sort(scores_f, 'descend');
scores_f = [index_f, sorted_f];

% Part b.
scores_a = zeros(70, 1);
for i=1:70
    scores_a(i) = AUROC_score(feature_data(:,i), feature_data(:,71));
end

[sorted_a, index_a] = sort(scores_a, 'descend');
scores_a = [index_a, sorted_a];



