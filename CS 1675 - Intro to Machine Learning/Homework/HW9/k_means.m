% Mouhammadou Dabo (mod20)
% Problem Assignment 9

% Problem 1. K-means clustering

function [sizes, distance] = k_means(n)
    sizes = [];
    distance = 0;
    clustering = importdata('clustering_data.txt');
    [idx, C] = kmeans(clustering, n);

    figure();
    hold on
    for i = 1:n
        data = clustering(find(idx==i),:);
        sizes = [sizes, size(data,1)];
        distance = distance + sqrt(sum(sum((data - C(i)).^2)));
        scatter(data(:,1), data(:,2), 'filled');
        hold on
    end
    scatter(C(:,1), C(:,2), 'k', 'filled');
    hold off
end