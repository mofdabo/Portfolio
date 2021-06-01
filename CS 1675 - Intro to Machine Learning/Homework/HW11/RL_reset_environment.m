function [ state ] = RL_reset_environment(model)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

prob_ranges=cumsum(model.RL_Prior);
prob=rand(1,1);
order=find(prob_ranges >= prob);
state=order(1);
end

