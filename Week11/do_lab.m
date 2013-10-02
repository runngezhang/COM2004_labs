load lab10_data.mat

nclusters=3;
x = makeClustersEqual(nclusters, 100);

scatter(x(:,1), x(:,2));

w=rand(2,nclusters)*100;

[w2, bel, iter]=kmeans(x',w);
iter
 
hold on

 
 scatter(x(bel==1,1), x(bel==1,2), 'r');
 scatter(x(bel==2,1), x(bel==2,2), 'g');
 scatter(x(bel==3,1), x(bel==3,2), 'b');
% scatter(x(bel==4,1), x(bel==4,2), 'k');
 
 