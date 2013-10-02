if (1)
  load letter_data.mat
  
  train_array = train;
  test_array = test1;
  
  [train_data, train_labels] = reformat_train(train_array);
  [test_data, test_labels] = reformat_train(test_array);
  train_labels = train_labels - 'A' + 1;
  test_labels = test_labels -'A' + 1;

  all_data=[train_data; test_data];
  all_labels=[train_labels, test_labels];
  
  shuf=randperm(1109);

  all_labels=all_labels(shuf);
  all_data=all_data(shuf,:);
 
  train_labels = all_labels(1:699);
  train_data = all_data(1:699,:);

  test_labels = all_labels(700:899);
  test_data = all_data(700:899,:);

  test2_labels = all_labels(900:1099);
  test2_data = all_data(900:1099,:);

  save test_data.mat test2_data test2_labels;
  clear test2_data;
  clear test2_labels;

  clear all_data;
  clear all_labels;
  clear test1;
  clear test2;
  clear test3;
  clear test4;
  clear test_array;
  clear train_array;
  clear train;
  clear shuf
  
  save lab_data.mat
end

clear all
load lab_data
load test_data

score = classify(train_data, train_labels, test_data, test_labels)
score = classify(train_data, train_labels, test2_data, test2_labels)

if (0)
d12=1;
for i=1:26
  for j=1:(i-1)
    c1=train_data(train_labels==i,:);
    c2=train_data(train_labels==j,:);
    d12=d12+log(divergence(c1,c2));
  end
end
end

%500   646   342   283   470   554   467   433   590   584   617
