% Problem 4, Attempt 1
% time = 0.061496 seconds.

tic;

results = rand(1000000, 4);
numInOrder = 0;

for i = 1 : 1000000
    if(results(i, 1) <= results(i, 2) && results(i, 2) <= results(i, 3) && results(i, 3) <= results(i, 4))
        numInOrder = numInOrder + 1;
    end
end

probability = numInOrder / 1000000

toc