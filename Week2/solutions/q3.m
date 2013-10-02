% Problem 3, Attempt 1
% time = 5.090718 seconds.

if (0)
  tic;
  
  smallestDiff = inf;
  
  for i = 1 : 1000
    for j = 1 : 1000
      diff = abs((i / j) - (pi / 4));
      
      if(diff < smallestDiff)
	smallestDiff = diff;
	a = i;
	b = j;
      end
    end
  end

a
b
toc

end

if (0)
  tic;
  
  nums = zeros(1000);
  for i = 1 : 1000
    nums(i, :) = i ./ (1 : 1000);
  end
  
  diffs = abs(nums - (pi / 4));
  
  [smallestDiff, index] = min(diffs(:));
  a = ceil(index / 1000)
  b = mod(index, 1000)
  toc
  
end



if(0)

  tic
  
  a = [1:1000];
  b = [1:1000];
  
  A = a' * (b.^-1);
  
  %Difference between A/B and Pi/4
  B = abs(A - (pi/4));
  
  %Minimum Value in Entire Matrix
  %Variable overwrite doesn't matter
  [a,b] = find(B==min(min(B)))
  
  toc

end



if(1)

  tic
  
  A = [1:1000]' * ([1:1000].^-1);
  
  %Difference between A/B and Pi/4
  B = abs(A - (pi/4));
  
  %Minimum Value in Entire Matrix
  %Variable overwrite doesn't matter
  [a,b] = find(B==min(min(B)));

  toc

end


