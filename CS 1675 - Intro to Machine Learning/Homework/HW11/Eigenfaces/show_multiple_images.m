function show_multiple_images(images)
n=size(images,2);
h = ceil(sqrt(n));
w = ceil(n / h);
    
figure;
colormap gray
subplot(h, w, 1)
    for i = 1:n 
        subplot(h, w, i)
        img_2d=reshape(images(:,i), 80, 70);
        image(img_2d)
    end
end

