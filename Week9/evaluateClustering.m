function score = evaluateClustering(clustering, labels)

% count clusters
nclusters=1;
maxclusters=length(clustering);
while (length(cell2mat(clustering(nclusters)))~=0 && nclusters<maxclusters)
  nclusters=nclusters+1;
end
nclusters
% form the confusion matrix
conf = zeros(nclusters,nclusters);
for row = 1:nclusters
  classes=labels(clustering{row});
  for col = 1:nclusters
    conf(row,col) = sum(classes==col);
  end  
end

 
% apply the Hungarian algorithm!
[matching, correct] = Hungarian(-conf);

% percent correct
score = -100* correct/sum(sum(conf));


