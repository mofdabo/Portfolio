function low_dim_images = project_PCA(images,eigenvecs,mean_matrix,m)
    centered_images=bsxfun(@minus,images,mean_matrix);
    v=eigenvecs(:,1:m); 
    for i=1:size(images,2)
        proj = v' * centered_images(:, i);
        low_dim_images(:, i) = proj; 
    end

end
