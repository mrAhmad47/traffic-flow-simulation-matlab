clc; clear; close all;

% Traffic Parameters
lambda = 0.4;                 % arrival rate (veh/sec)
mu = 0.8;                     % service rate (veh/sec)
cycleRange = 30:5:180;        % Search cycles from 30s to 180s

bestDelay = Inf;
optimalCycle = 0;
optimalGreen = 0;

for C = cycleRange
    for g = 5:5:C-10    % Green time from 5s to C-10s (leaving time for red/yellow)
        
        % Calculate service capacity during green
        serviceRate = mu * g;
        
        % Delay formula: average delay approximation
        delay = (lambda^2) / (2 * mu * (mu - lambda)) + (C - g);
        
        if delay < bestDelay
            bestDelay = delay;
            optimalCycle = C;
            optimalGreen = g;
        end
    end
end

% Display results
fprintf('? Optimization Results\n');
fprintf('Optimal Cycle Time: %.2f sec\n', optimalCycle);
fprintf('Optimal Green Time: %.2f sec\n', optimalGreen);
fprintf('Minimum Estimated Delay: %.2f sec\n\n', bestDelay);


% Store in Workspace
OptimalCycle = optimalCycle;
OptimalGreen = optimalGreen;
MinDelay = bestDelay;
