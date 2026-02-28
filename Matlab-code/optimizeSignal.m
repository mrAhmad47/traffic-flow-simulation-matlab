function delay = optimizeSignal(cycle)
lambda = 0.4; % arrival rate
mu = 0.7;     % service rate

green = cycle * 0.5; % assume 50% green split
effectiveMu = mu * (green / cycle);

delay = lambda / (effectiveMu * (effectiveMu - lambda));
end
