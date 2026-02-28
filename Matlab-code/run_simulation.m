clc; clear; close all;

% Simulation Parameters
lambda = 0.4;   % vehicle arrival rate per second
mu = 0.7;       % vehicle service rate per second
T = 3600;       % simulate for 1 hour (3600 sec)

% Run Simulation
[avgWait, avgQueue, throughput, queueHistory, timeVec] = simulateIntersection(lambda, mu, T);

% Display results
disp('==== Traffic Simulation Results ====');
disp(['Average Waiting Time: ', num2str(avgWait), ' sec']);
disp(['Average Queue Length: ', num2str(avgQueue), ' cars']);
disp(['Intersection Utilization: ', num2str(throughput*100), '%']);

% Plot Queue Length Over Time
figure;
plot(timeVec, queueHistory, 'LineWidth', 2);
title('Queue Length Over Time');
xlabel('Time (seconds)');
ylabel('Queue Length (cars)');
grid on;

% Plot Histogram of Queue Length Distribution
figure;
histogram(queueHistory);
title('Queue Length Frequency Distribution');
xlabel('Queue Size (cars)');
ylabel('Frequency');
grid on;
