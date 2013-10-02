function [score, cm] = classify(train, train_labels, test, test_labels, features)

% Nearest neighbour classification.

% Use all feature is no feature parameter has been supplied
if (nargin<5)
  features=1:size(train,2);
end

% Select the desired features from the training and test data
train = train(:, features);
test = test(:, features);

% Super compact implementation of nearest neighbour 
x= test * train';
modtest=sqrt(sum(test.*test,2));
modtrain=sqrt(sum(train.*train,2));
dist = x./(modtest*modtrain'); % cosine distance
[d,i]=max(dist');
class = train_labels(i);
score = 100 * sum(test_labels==class)/length(class);

% If 2 outputs have been requested then construct the confusion matrix
if nargout==2
  nclasses = max(test_labels);
  cm=zeros(nclasses,nclasses);
  for i=1:length(test_labels)
    cm(test_labels(i),class(i))=cm(test_labels(i),class(i))+1;
  end
end
