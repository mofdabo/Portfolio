function [eigen_vecs, mean_matrix] = calc_eigen_vecs(x)

    % subtract mean
    mean_matrix = mean(x, 2);
    x = bsxfun(@minus, x, mean_matrix);

    % calculate covariance
    s = cov(x');

    % obtain eigenvalue & eigenvector
    [eigen_vecs, D] = eig(s);
    eigval = diag(D);

    % sort eigenvalues in descending order
    eigval = eigval(end: - 1:1);
    eigen_vecs = fliplr(eigen_vecs);


end
