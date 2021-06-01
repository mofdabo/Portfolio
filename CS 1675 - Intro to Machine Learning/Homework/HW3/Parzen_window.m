function [density_x] = Parzen_window(x, h, D)
    N = size(D);
    N = N(1);
   
    K = 0;
    
    for i = 1:N
        if abs(D(i) - x) <= h/2
            K = K + 1;
        end
    end
    V = h;
    
    density_x = K /(N * V);
end