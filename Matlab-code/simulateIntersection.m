function [avgWait, avgQueueLength, throughput, queueHistory, timeVec] = simulateIntersection(lambda, mu, T)
% Simulates traffic queue at a signal-controlled intersection (M/M/1 queue)

dt = 1;                % time step (1 second)
timeVec = 0:dt:T;
queue = 0;             
queueHistory = zeros(size(timeVec));
waitTimes = [];

for t = 1:length(timeVec)

    % Generate vehicle arrivals (Poisson)
    arrivals = poissrnd(lambda);

    % Add arrivals to queue
    queue = queue + arrivals;

    % Service (vehicles passing intersection)
    if queue > 0
        served = binornd(queue, mu*dt);
        queue = max(queue - served, 0);
    end

    % Track queue history
    queueHistory(t) = queue;

    % Record waiting times
    if arrivals > 0
        waitTimes = [waitTimes, queue / max(mu, 0.0001)];
    end

end

avgWait = mean(waitTimes);
avgQueueLength = mean(queueHistory);
throughput = sum(queueHistory > 0) / length(queueHistory); % busy time %

end
