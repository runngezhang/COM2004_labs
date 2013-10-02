function x = makeClusters(nclusters, clustersize, spread)

if (nargin==2)
  spread=20;
end

x=[];
for i=1:nclusters
  pmean = rand(1,2)*100;
  covterm=0;
  pcov = [[rand*spread covterm];[covterm rand*spread]];
  x = [x; mvnrnd(pmean, pcov, clustersize)];
end
