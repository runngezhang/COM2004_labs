function points = cluster(testdata, dm_cc)


%%% DO NOT MESS WITH THESE SEEDS
%randn("seed",1);
%rand("seed", 0)

x = testdata(1:100,:);

%dm_cc = @(x,y)dm_cc_min(x, y, @dm_pp_euclid);
%c = agglomerative_cluster(x, dm_cc, @image_clusters, 4);

%dm_cc = @(x,y)dm_cc_mean(x, y, @dm_pp_cosine);
c = agglomerative_cluster(x, dm_cc, @image_clusters, 26);


%%%%%%%%%%%%%%%%

function c = agglomerative_cluster(points, dm_cc, display_function, numclusters)

N = size(points,1);
% Initial R0 clustering
for i=1:N
  c{i} = [i];
end

display_function(points,c);
drawnow

for t = 1:N-numclusters
  fprintf('Nclusters remaining = %d  \r',N-t+1);  
  [i, j] = find_closest_pair(points, c, dm_cc);
  c = merge_clusters(c, i, j);
  display_function(points,c);
  drawnow
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

bigimage=zeros(480,size(clusters,2)*30);

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

size(bigimage)
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
diff = (p1-p2);
dist = sqrt(sum(diff.*diff));

function dist = dm_pp_manhattan(p1, p2)
dist = sum(abs(p1-p2));

function dist = dm_pp_cosine(p1, p2)
dist = 1.0-sm_pp_cosine(p1,p2);

%%

function dist = sm_pp_inner(p1, p2)
dist = 1/(p1 * p2');

function dist = sm_pp_cosine(p1,p2)
dist = p1*p2'/ (veclen(p1)*veclen(p2));


%%%%%
function d = veclen(x)
d = sqrt(sum(x.*x));
