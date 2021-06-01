% Mouhammadou Dabo (mod20)
% Problem Assignment 11

% Problem 1. Reinforcement learning agent

% Part a.
% load the model of the environment from file model.mat
% and keep it stored in the variable model.
RL_init_model;

% place the agent into initial state (selected randomly based on prior)
init_state = RL_reset_environment(model);

% Part b.
policy = [1 1 3 2]';

current_state = init_state;
action =  policy(current_state);

for i = 1:10
    [new_state, reward] = RL_simulate_one_step(current_state, action, model);
    result = sprintf("Step %d: State = %d, Action = %d, Reward = %d", i, current_state, action, reward);
    disp(result);
    current_state = new_state;
    action =  policy(current_state);
end

% Part c.
policy = [1 1 3 2]'; 
temp = [0 0 0 0]'
num = [0 0 0 0]';
values = [0 0 0 0]';
discount_factor = 0.95;

RL_init_model;
init_state = RL_reset_environment(model);
current_state = init_state;

for i = 1:15000
    % record the actual values of the policy
    if mod(i, 100)==0
        values = [values, temp];
    end
    % reset the environment every 200 steps to its initial state
    if mod(i, 200)==0
        init_state = RL_reset_environment(model);
        current_state = init_state;
    end
    
    action =  policy(current_state);
    [new_state, reward] = RL_simulate_one_step(current_state, action, model);
    
    learning_rate = 1 / (1 + num(current_state))^0.6;
    temp(current_state) = (1 - learning_rate) * temp(current_state) + learning_rate * (reward + (discount_factor * temp(new_state)))
    num(current_state) = num(current_state) + 1;
    
    current_state = new_state;
end

values = [values, temp]';

figure()
plot(values)
title('')
xlabel('x')
ylabel('Value of Policy')
legend('State 1', 'State 2', 'State 3', 'State 4')

% Part d.
policy = [1 2 3 1]'; 
temp = [0 0 0 0]'
num = [0 0 0 0]';
values = [0 0 0 0]';
discount_factor = 0.95;

RL_init_model;
init_state = RL_reset_environment(model);
current_state = init_state;

for i = 1:15000
    % record the actual values of the policy
    if mod(i, 100)==0
        values = [values, temp];
    end
    % reset the environment every 200 steps to its initial state
    if mod(i, 200)==0
        init_state = RL_reset_environment(model);
        current_state = init_state;
    end
    
    action =  policy(current_state);
    [new_state, reward] = RL_simulate_one_step(current_state, action, model);
    
    learning_rate = 1 / (1 + num(current_state))^0.6;
    temp(current_state) = (1 - learning_rate) * temp(current_state) + learning_rate * (reward + (discount_factor * temp(new_state)))
    num(current_state) = num(current_state) + 1;
    
    current_state = new_state;
end

values = [values, temp]';

figure()
plot(values)
title('')
xlabel('x')
ylabel('Value of Policy')
legend('State 1', 'State 2', 'State 3', 'State 4')






