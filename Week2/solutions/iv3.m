% Problem 4, Attempt 3
% time = 0.064276 seconds.

tic;

results = rand(1000000, 4);
inOrder = results(:, 1) <= results(:, 2) & results(:, 2) <= results(:, 3) & results(:, 3) <= results(:, 4);

numInOrder = sum(inOrder);
probability = numInOrder / 1000000

toc