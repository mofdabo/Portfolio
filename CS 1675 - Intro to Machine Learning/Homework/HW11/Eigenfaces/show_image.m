function show_image(img)
figure;
colormap gray
img_2d=reshape(img, 80, 70);
image(img_2d);
end

