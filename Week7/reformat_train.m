function [X, labels] = reformat_train(train)

X = zeros(length(train), length(train(1).fvector));

for i=1:length(train)
  X(i,:)  = train(i).fvector;
  labels(i) = train(i).label;
end
