load lab_data;
load test_data;



classify(train_data, train_labels, test_data, test_labels)

classify(train_data, train_labels, test_data, test_labels,1:10)

% Compute 1-D DCT of train and test data
dcttrain=dct(train_data(:,:)')';
dcttest=dct(test_data(:,:)')';
classify(dcttrain, train_labels, dcttest, test_labels, 1:10)
classify(dcttrain, train_labels, dcttest, test_labels, 2:11)

% Compute 2-D DCT of train and test data
dct2train=zeros(699,9);
dct2test=zeros(200,9);
for i=1:699
  x= reshape(train_data(i,:),30,30);
  y = dct2(x);
  y = y(5:7,5:7);
  dct2train(i,:) = reshape(y,1,9);
end

for i=1:200
  x= reshape(test_data(i,:),30,30);
  y = dct2(x);
  y = y(5:7,5:7);
  dct2test(i,:) = reshape(y,1,9);
end



% Compute 2-D DCT of train and test data
dct2train=zeros(699,10);
dct2test=zeros(200,10);
for i=1:699
  x= reshape(train_data(i,:),30,30);
  y = dct2(x);
  dct2train(i,1:5) = y(4:8,1);
  dct2train(i,6:10) = y(1,4:8);
end

for i=1:200
  x= reshape(test_data(i,:),30,30);
  y = dct2(x);
  dct2test(i,1:5) = y(4:8,1);
  dct2test(i,6:10) = y(1,4:8);
end




% Center data and compute covariance
centered = train_data-repmat(mean(train_data), 699,1);
covx = (centered' * centered)/699;

covx = cov (train_data);
% Compute first 11 eigenvectors of covariance matrix
[v, lambda] = eigs(covx, 15);;
% Transform training and test data
pcatrain = (train_data-repmat(mean(train_data), 699,1))*v;
pcatest = (test_data-repmat(mean(train_data), 200,1))*v;
pcatest2 = (test2_data-repmat(mean(train_data), 200,1))*v;

classify(pcatrain, train_labels, pcatest, test_labels,1:10)
classify(pcatrain, train_labels, pcatest, test_labels,2:15)



xpcatrain = train_data*v;
xpcatest = test_data*v;
xpcatest2 = test2_data*v;

classifyEuc(xpcatrain, train_labels, xpcatest, test_labels,1:10)
classifyEuc(xpcatrain, train_labels, xpcatest, test_labels,2:15)



smooth_train = train_data * v * v';

smooth_train15 = (train_data -repmat(mean(train_data), 699,1)) * v * v' + -repmat(mean(train_data), 699,1));


smooth_train7 = (train_data -repmat(mean(train_data), 699,1)) * v(:,1:7) * v(:,1:7)' + -repmat(mean(train_data), 699,1));


