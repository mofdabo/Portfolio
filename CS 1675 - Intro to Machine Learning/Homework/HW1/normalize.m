function[x_1] = normalize(x1) 
    x2 = mean(x1);
    x3 = std(x1);
    x4 = x1 - x2;
    x_1 = x4./x3;
end
