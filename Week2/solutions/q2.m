% Problem 2,

if (0)
  tic;
  randNums = rand(1, 1000000);
  smallestDiff = 1;
  largestDiff = 0;
  
  for i = 2 : 1000000
    diff = abs(randNums(:, i) - randNums(:, i - 1));
    if(diff < smallestDiff)
      smallestDiff = diff;
    end
    if(diff > largestDiff)
      largestDiff = diff; 
    end
  end
  
  smallestDiff
  largestDiff
  toc
end

if(0)
  
  tic;
  randNums = rand(1, 1000000);
  diffs = abs(diff(randNums));
  
  smallestDiff = min(diffs)
  largestDiff = max(diffs)
  toc
end

if(1)
  tic
  
  r = rand(1,1000000);
  d = abs(diff(r));
  
  min(d)
  max(d)
  
  toc
end