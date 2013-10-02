% Problem 1, Attempt 1

if (0)
  tic;
  numsEndingIn7 = 0;
  
  for i = 1 : 1000
    for j = 1 : 1000
      if(mod(i * j, 10) == 7)
	numsEndingIn7 = numsEndingIn7 + 1;
      end
    end
  end
  
  numsEndingIn7
  
  toc
end

if (0)
  tic;
  a = zeros(1000);
  a(:, 1) = 1 : 1000;
  b = zeros(1000);
  b(1, :) = 1 : 1000;
  
  matrix = a * b;
  
  numsEndingIn7 = mod(matrix, 10) == 7;
  sum(sum(numsEndingIn7))
  
  toc
end


if (1)
  tic
  
%  a = [1:1000];
  
  A = mod([1:1000]' * [1:1000],10);
  
%  B=find(A==7);
%  numel(B)

  sum(sum(A==7));


  toc
end
