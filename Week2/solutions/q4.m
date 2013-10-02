% Problem 4


if(0)
  
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
  
end


if(0)
  tic;
  
  results = rand(1000000, 4);
  numInOrder = 0;
  
  for i = 1 : 1000000
    if(issorted(results(i, :)))
      numInOrder = numInOrder + 1; 
    end
  end
  
  probability = numInOrder / 1000000
  toc
end


if (1)
  
  tic;
  
  results = rand(4,1000000);
  inOrder = results(:,1) <= results(:, 2) & results(:, 2) <= results(:, 3) & results(:, 3) <= results(:, 4);
  
  probability = sum(inOrder) / 1000000

  toc
  
end