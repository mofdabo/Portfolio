% Mouhammadou Dabo (mod20)
% Problem Assignment 11

% Problem 1. Reinforcement learning agent
% Part e.
Qsa = zeros(4, 3);
nsa = zeros(4, 3);

policy = zeros(4, 1); 
%temp = zeros(4, 1);
V = zeros(4,1);
e = 0.4;

discount_factor = 0.95;

RL_init_model;
init_state = RL_reset_environment(model);
current_state = init_state;

for i = 1:15000
    % reset the environment every 200 steps to its initial state
    if mod(i, 200)==0
        init_state = RL_reset_environment(model);
        current_state = init_state;
    end
    
    choice = rand();
    
    if choice < e
        action = floor((choice * size(Qsa, 2)) / e) + 1;
    else
        [~, action] = max(Qsa(current_state, :));
    end
    
    [new_state, reward] = RL_simulate_one_step(current_state, action, model);
    
    learning_rate = 1 / (1 + nsa(current_state, action))^0.6;
    
    Qsa(current_state, action) = (1 - learning_rate) * Qsa(current_state, action) + learning_rate * (reward + (discount_factor * max(Qsa(new_state, :))))
    nsa(current_state, action) = nsa(current_state, action) + 1;
    
    policy(current_state) = action;
    V(current_state) = max(Qsa(current_state, action));
    
    current_state = new_state;
end





