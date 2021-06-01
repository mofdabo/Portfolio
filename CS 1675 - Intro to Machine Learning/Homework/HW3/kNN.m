function [density_x] = kNN(x, k, D)
    N = size(D);
    N = N(1);
    
    K = k;

    distances = sort(abs(D - x));
    
    V = distances(K);
    
    density_x = K /(N * V);
end