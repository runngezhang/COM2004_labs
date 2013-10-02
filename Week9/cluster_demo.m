function points = cluster_demo

%%% DO NOT MESS WITH THESE SEEDS
randn("seed",1);
rand("seed", 0)

ic1=mvnrnd([10,10],[1.5, 0; 0, 1.5], 8);
ic2=mvnrnd([14,14],[1.5, 0; 0, 1.5], 8);
points = [ic1; ic2];

if(0)
  
dm_pc = @(x,y)dm_pc_min(x, y, @dm_pp_euclid);

figure

points1 = points(randperm(size(points,1)), :);
c = sequential_cluster(points1, 3, 1.0, dm_pc, 'demo1_rad1');


figure

points2 = points([10, 12, 14, 1, 4, 2, 9, 8, 6, 15, 16, 3, 11, 5, 7, 13],:);
c = sequential_cluster(points2, 3, 1.0, dm_pc, 'demo2_rad1');

figure

dm_pc = @(x,y)dm_pc_min(x, y, @dm_pp_euclid);
c = sequential_cluster(points2, 3, 4.0, dm_pc, 'demo3_rad4');


dm_cc = @(x,y)dm_cc_min(x, y, @dm_pp_euclid);

c = agglomerative_cluster(points, dm_cc, [6,18,7,18], 'demo_agglom', @display_clusters);

end



%%%%%%%%%%%%%%%%%%%%%%%%%

%%% DO NOT MESS WITH THESE SEEDS
randn("seed",1);
rand("seed", 0)

load('data.mat');

% P's
x(1,:)=reshape(test1(13).image,1,900);
x(2,:)=reshape(test1(25).image,1,900);
x(3,:)=reshape(test1(30).image,1,900);
x(4,:)=reshape(test1(62).image,1,900);

% O's
x(5,:)=reshape(test1(18).image,1,900);
x(6,:)=reshape(test1(24).image,1,900);
x(7,:)=reshape(test1(32).image,1,900);
x(8,:)=reshape(test1(54).image,1,900);

% L's
x(9,:)=reshape(test1(5).image,1,900);
x(10,:)=reshape(test1(9).image,1,900);
x(11,:)=reshape(test1(11).image,1,900);
x(12,:)=reshape(test1(59).image,1,900);

% D's
x(13,:)=reshape(test1(65).image,1,900);
x(14,:)=reshape(test1(108).image,1,900);
x(15,:)=reshape(test1(113).image,1,900);
x(16,:)=reshape(test1(125).image,1,900);

% Shuffle to make more interesting
x = x(randperm(size(x,1)), :);

dm_cc = @(x,y)dm_cc_min(x, y, @dm_pp_euclid);
c = agglomerative_cluster(x, dm_cc, [1, 480, 1, 480], 'demo_agglom_chars_euclid', @image_clusters);

dm_cc = @(x,y)dm_cc_min(x, y, @dm_pp_cosine);
c = agglomerative_cluster(x, dm_cc, [1, 480, 1, 480], 'demo_agglom_chars_cosine', @image_clusters);





%%%%%%%%%%%%%%%%

function c = agglomerative_cluster(points, dm_cc, axissize, plotname, display_function)

N = size(points,1);
% Initial R0 clustering
for i=1:N
  c{i} = [i];
end

display_function(points,c);
axis(axissize);
print(sprintf('%s_frame0.eps',plotname),'-depsc');
  
for t = 1:N-1
  [i, j] = find_closest_pair(points, c, dm_cc);
  

  ch{1}=c{i}; ch{2}=c{j};
  display_function(points,c, ch, [i,j]);

  axis(axissize);
  print(sprintf('%s_frame%d_a.eps',plotname,t),'-depsc');
  
  c = merge_clusters(c, i, j);

  display_function(points,c);
  axis(axissize);
  print(sprintf('%s_frame%d_b.eps',plotname,t),'-depsc');

end


%%%%%%%%%%%%%%
function [i1, j1] = find_closest_pair(points, c, dm_cc)

N = length(c);

i1=1;
j1=2;

mindist = dm_cc(points(c{i1},:), points(c{j1},:));

for i=1:N
  for j=1:i-1
    if (length(c{i}) >0 && length(c{j}) > 0)
      dist = dm_cc(points(c{i},:), points(c{j},:));
      if (dist<mindist)
        mindist=dist;
        j1=j;
        i1=i;
      end
    end
  end
end


%%%%%%%%%%%%%%%%

function c2 = merge_clusters(c1, i, j)
N=length(c1);
c2=c1;
c2{i} = [c2{i} c2{j}];
for k=j:N-1
  c2{k}=c2{k+1};
end
c2{N} = [];

%%%%%%%%%%%%%%%%

function c = sequential_cluster(points, max_clusters, theta, dm_pc, plotname)

N = size(points,1);
nclusters = 1;

display_clusters(points,{});
axis([6,18,7,18]);
print(sprintf('%s_frame0.eps',plotname),'-depsc');

c{1} = [1];

display_clusters(points,{},{1});
axis([6,18,7,18]);
print(sprintf('%s_frame1_a.eps',plotname),'-depsc');

display_clusters(points,c);
axis([6,18,7,18]);
print(sprintf('%s_frame1_b.eps',plotname),'-depsc');

for i=2:N;

  display_clusters(points, c, {i});
  axis([6,18,7,18]);
  print(sprintf('%s_frame%d_a.eps',plotname,i),'-depsc');
  
  for j=1:nclusters
    dist(j)=dm_pc(points(i,:), points(c{j},:));
  end
  [mdist, mindex] = min(dist);
  if ((mdist > theta) && (nclusters < max_clusters))
    nclusters=nclusters+1;
    c{nclusters} = [i];
  else
    c{mindex} = [c{mindex}, i]; 
  end
  

  display_clusters(points,c);
  axis([6,18,7,18]);
  
  print(sprintf('%s_frame%d_b.eps',plotname, i),'-depsc');
  
end




%%%%%%%%%%%%
% Make scatter plot of points and colour code them according to the supplied clusters
% hclusters are highlighted

function display_clusters(points, clusters, hclusters)

hold off

for i=1:size(points,1)
  scatter(points(i,1), points(i,2),5,[0,0,0]);

  hold on;
end

for i=1:size(clusters, 2)
  ci = clusters{i};
  cluster_colour = get_cluster_colour(i);
  for j=1:length(ci)
    scatter(points(ci(j),1),points(ci(j),2), 10, cluster_colour);
  end
end

if (nargin==3)
    
  for i=1:size(hclusters, 2)
    ci = hclusters{i};
    cluster_colour = get_cluster_colour(i);
    for j=1:length(ci)
      scatter(points(ci(j),1),points(ci(j),2), 12, [0,0,0]);
      scatter(points(ci(j),1),points(ci(j),2), 8, [0,0,0]);
      scatter(points(ci(j),1),points(ci(j),2), 6, [0,0,0]);
      scatter(points(ci(j),1),points(ci(j),2), 4, [0,0,0]);
    end
  end
end


%%%%%%%%%%%
function image_clusters(points, clusters, hclusters, hcluster_indexes)

bigimage=zeros(480,480);
for i=1:size(clusters, 2)
  ci = clusters{i};
  y=(i-1)*30+1;
  for j=1:length(ci)
    x=(j-1)*30+1;
    bigimage(x:x+29,y:y+29) = reshape(points(ci(j),:),30,30);
  end
end

if (nargin==4)
  for i=1:size(hcluster_indexes, 2)
    ci = hcluster_indexes(i);
    y=(ci-1)*30+1;
    bigimage(1:480,y:y+29) = bigimage(1:480,y:y+29)*2; 
  end
end

imagesc(bigimage);
colormap(gray);
axis off

%%%%%%%%%%%

function cluster_colour = get_cluster_colour(i)

colour_list = [
    1, 0, 0;
    0, 1, 0;
    0, 0, 1;
    0, 1, 1;
    1, 0, 1;
    1, 1, 0;
              ];
if (i<7)
  cluster_colour = colour_list(i,:);
else
  cluster_colour=[rand, rand, rand];
end
  
%%%%%%%%%%%%%%%%%%%
% Cluster to cluster distances

function dist = dm_cc_max(c1, c2, dm_pp)
distm = dm_cc_inner(c1, c2, dm_pp);
dist = max(max(distm));

function dist = dm_cc_min(c1, c2, dm_pp)
distm = dm_cc_inner(c1, c2, dm_pp);
dist = min(min(distm));

function dist = dm_cc_mean(c1, c2, dm_pp)
distm = dm_cc_inner(c1, c2, dm_pp);
dist = mean(mean(distm));

function dist = dm_ccr(c1, c2, dm_pp)
cr1= mean(c1,2);
cr2 = mean(c2,2);
dist = dm_pp(cr1, cr2);




function distm = dm_cc_inner(c1, c2, dm_pp)
nc1 = size(c1,1);
nc2 = size(c2,1);

for i=1:nc1
  for j=1:nc2
    distm(i,j) = dm_pp(c1(i,:), c2(j,:));
  end
end


%%%%%%%%%%%
% Point to cluster distances

function dist = dm_pc_max(p1, c, dm_pp)
distv = dm_pc_inner(p1,c,dm_pp);
dist = max(distv);

function dist = dm_pc_min(p1, c, dm_pp)
distv = dm_pc_inner(p1,c,dm_pp);
dist = min(distv);

function dist = dm_pc_mean(p1, c, dm_pp)
distv = dm_pc_inner(p1,c,dm_pp);
dist = mean(distv);

function dist = dm_pcr(p1,c, dm_pp)
cr = mean(c,2);
dist = dm_pp_inner(p1,cr);



function dist = dm_pc_inner(p1, c, dm_pp)
nc = size(c,1);
for i=1:nc
  dist(i) = dm_pp(p1,c(i,:));
end


%%%%%% 
% Point to point distances

function dist = dm_pp_euclid(p1, p2)
dist = veclen(p1-p2);

function dist = dm_pp_manhattan(p1, p2)
d = p1 - p2;
dist = sum(abs(d));

function dist = dm_pp_cosine(p1, p2)
dist = 1.0-sm_pp_cosine(p1,p2);

%%

function dist = sm_pp_inner(p1, p2)
dist = 1/(p1 * p2');

function dist = sm_pp_cosine(p1,p2)
dist = p1 * p2'/ (veclen(p1)*veclen(p2));


%%%%%
function d = veclen(x)
d = sqrt(sum(x.*x));
