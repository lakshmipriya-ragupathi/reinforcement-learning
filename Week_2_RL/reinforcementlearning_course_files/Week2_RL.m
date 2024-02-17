rng(42); %making sure the robot starts at the same place everytime
load robotmodel.mat; %loading the pretrained model
agent; %defining the agent
env; %defining the environment
opts = rlSimulationOptions("MaxSteps",100,"NumSimulations",10);
simout = sim(agent,env,opts);


% Initialize a vector to store total rewards
totalRewards = zeros(1, numel(simout));

% Loop through all simulations to calculate total rewards
for k = 1:numel(simout)
    totalRewards(k) = sum(simout(k).Reward.Data);
end

% Plot histogram
figure;
histogram(totalRewards);
xlabel('Total Reward');
ylabel('Probability');
title('Histogram of Total Rewards across Simulations');

