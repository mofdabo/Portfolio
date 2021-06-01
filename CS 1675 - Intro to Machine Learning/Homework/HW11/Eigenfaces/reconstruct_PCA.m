function recon_images = reconstruct_PCA(low_dim_images, eigenvecs, mean_matrix)
    [m,n]=size(low_dim_images);
    for i=1:n
    aux_proj = eigenvecs(:,1:m)* low_dim_images(:,i);
    recon_images(:,i)=aux_proj+ mean_matrix;
    end
end