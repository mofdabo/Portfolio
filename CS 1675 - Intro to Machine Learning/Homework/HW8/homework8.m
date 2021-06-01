% Mouhammadou Dabo (mod20)
% Problem Assignment 8 

% Problem 2. Pneumonia diagnosis

% Part a.
[pneumonia, fever, paleness, cough, highWBCcount] = main8_2learning();

% Part d.
symptoms = importdata('example.txt');
for i = 1:size(symptoms, 1)
    current_row = symptoms(i, :);
    probability = main8_2inference(current_row);
    fprintf('With the parameters %d, %d, %d, %d, the probabiltiy the patient has pneumonia is: %f \n', current_row(1), current_row(2), current_row(3), current_row(4), probability);
end