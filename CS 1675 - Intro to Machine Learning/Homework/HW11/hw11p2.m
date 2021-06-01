% Mouhammadou Dabo (mod20)
% Problem Assignment 11

% Problem 2. Eigenfaces

% Task 1.
[train_img, train_label, test_img, test_label] = data_loader('data/classification');

% select randomly a set of 9 images from the training data.
ncol = 9;
x = randperm(size(train_img, 2), ncol);
S = train_img(:,x);
% Visualize the 9 images in S using the show_multiple_images function.
show_multiple_images(S)

[eigenvecs, mean_matrix] = calc_eigen_vecs(S);

%%% use 5 dimensional representation
low_dim_train = project_PCA(S, eigenvecs, mean_matrix, 5);
recon_train = reconstruct_PCA(low_dim_train, eigenvecs, mean_matrix);
% show reconstructed images based on 5 dimensional represenation
show_multiple_images(recon_train(:,1:9))

%%% use 20 dimensional representation
low_dim_train2 = project_PCA(S, eigenvecs, mean_matrix, 20);
recon_train2 = reconstruct_PCA(low_dim_train2, eigenvecs, mean_matrix);
% show reconstructed images based on 20 dimensional represenation
show_multiple_images(recon_train2(:,1:9))

%%% use 50 dimensional representation
low_dim_train3 = project_PCA(S, eigenvecs, mean_matrix, 50);
recon_train3 = reconstruct_PCA(low_dim_train3, eigenvecs, mean_matrix);
% show reconstructed images based on 50 dimensional represenation
show_multiple_images(recon_train3(:,1:9))

%%% use 100 dimensional representation
low_dim_train4 = project_PCA(S, eigenvecs, mean_matrix, 100);
recon_train4 = reconstruct_PCA(low_dim_train4, eigenvecs, mean_matrix);
% show reconstructed images based on 100 dimensional represenation
show_multiple_images(recon_train4(:,1:9))












