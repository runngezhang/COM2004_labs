%faces = loadfaces;

train_labels = reshape(repmat(1:40,9,1),1,360)
test_labels = 1:40;

all_score = 0;
all_cm = zeros(40,40);

for slice = 0:9
  slice
  train = faces(mod(1:400,10)~=slice,:);
  test = faces(mod(1:400,10)==slice,:);
  
  [pca_axes, mean_vector] = learnPCA(train, 10);
  
  reduced_train = reducePCA(train, pca_axes, mean_vector);
  reduced_test = reducePCA(test, pca_axes, mean_vector);
  
  [score, cm] = classify(reduced_train,train_labels,reduced_test,test_labels,1:10)
  
  all_score = all_score + score;
  all_cm = all_cm + cm;
end

all_score = all_score/10;

