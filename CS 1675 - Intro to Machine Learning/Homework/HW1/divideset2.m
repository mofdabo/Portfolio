function[x_1, x_2] = divideset2(x1, x2)
    [i,j] = size(x1) ;
    P = x2 ;
    idx = randperm(i)  ;
    x_1 = x1(idx(1:round(P*i)),:) ; 
    x_2 = x1(idx(round(P*i)+1:end),:) ;
end