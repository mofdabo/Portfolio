function  [vec] = vectorize(imgs)
    [h, w, n] = size(imgs);
    d = h * w;
    vec = reshape(imgs, [d n]);
    vec = double(vec);
end