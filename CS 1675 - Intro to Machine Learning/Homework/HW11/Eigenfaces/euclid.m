function [d] = euclid(a, b)
  d = sqrt(sum((a - b) .^ 2));
end