% Mouhammadou Dabo (mod20)
% Problem Assignment 8

% Problem 2. Pneumonia diagnosis

% Part d.
function [probability] = main8_2inference(symptoms)
   [pneumonia, fever, paleness, cough, highWBCcount] = main8_2learning();
   parameters = {fever, paleness, cough, highWBCcount};
   
   t = 1;
   f = 1;

   for i = 1:4
       value = parameters{i};
       if(symptoms(i) == 1)
           t = t * value(1, 1);
           f = f * value(2, 1);
       elseif(symptoms(i) == 0)
           t = t * value(1, 2);
           f = f * value(2, 2);
       end
   end
   
   t = t * pneumonia(1);
   f = f * pneumonia(2);
   
   probability = t / (t + f);
end