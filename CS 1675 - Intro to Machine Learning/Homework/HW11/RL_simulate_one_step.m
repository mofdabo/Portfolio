function [new_state, reward] = RL_simulate_one_step(state, action, model)
%RL simulator with 4 states and 3 actions
% Simulates one step (s,a) -> (s',r)
% Internal structures: transition and reward models
%% transitions for action 1

%%%

%%%load model
RL_Transitions=model.RL_Transitions
next_state_probs=RL_Transitions(state,:,action)
prob_ranges=cumsum(next_state_probs)
prob=rand(1,1)
order=find(prob_ranges >= prob);
new_state=order(1);
RL_Rewards=model.RL_Rewards;
reward=RL_Rewards(state,new_state,action);

end

