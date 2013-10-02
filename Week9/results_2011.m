% G.Gill
features= [285,311,433,454,488,491,503,588,614,638];

load lab9_data  


test_data_r = test_data(:,features);

evaluateClustering(c, test_labels(1:100))                                                  

for i=1:20
  fprintf('%s\n',char('A'+test_labels(c{i})-1))
end
