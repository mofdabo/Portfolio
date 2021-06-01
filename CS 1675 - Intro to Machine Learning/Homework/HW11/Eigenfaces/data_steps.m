%%%% code

[train_img, train_label, test_img, test_label] = data_loader('data/classification');

show_image(train_img(:,1));
show_multiple_images(train_img(:,1:40))

[eigenvecs, mean_matrix] = calc_eigen_vecs(train_img);

%%% use 20 dimensional representation
low_dim_train = project_PCA(train_img,eigenvecs,mean_matrix,20);
recon_train = reconstruct_PCA(low_dim_train, eigenvecs, mean_matrix);
% show reconstructed images based on 20 dimensional represenation
show_image(recon_train(:,1));
show_multiple_images(recon_train(:,1:40))

%%% use 50 dimensional representation
low_dim_train2 = project_PCA(train_img,eigenvecs,mean_matrix,50);
recon_train2 = reconstruct_PCA(low_dim_train2, eigenvecs, mean_matrix);
% show reconstructed images based on 50 dimensional represenation
show_image(recon_train2(:,1));
show_multiple_images(recon_train2(:,1:40))
