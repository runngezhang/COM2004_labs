% Problem 1, Attempt 1

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