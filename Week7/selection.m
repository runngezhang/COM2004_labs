function feature=selection(train_data,train_labels)


alpha=0.01;

d = zeros(1,900);

nlabels=26;

for j=1:26
  for k=1:26
    if (j~=k)
      class1=train_data(train_labels==j,:);
      class2=train_data(train_labels==k,:);
      d=d+divergence(class1,class2);
    end
  end
end


d=d/(25*26);

[d_sorted, indexes]=sort(-d);

feature(1)=indexes(1);

for nfeatures=1:9
  nfeatures
  corR=zeros(1,900);
  for n=1:nfeatures
    for i=1:900
      cm=corrcoef(train_data(:,feature(n)), train_data(:,i));
      %	    cm
      %	    c=cm(1,2);
      corR(1,i) = corR(1,i)+ cm;
    end
  end
  
  corR=corR/nfeatures;
        
  corR
  for m=1:900
    corrected_d(m)=d(m)-alpha*corR(m);
  end
  
  % make sure that f1 wont be the best again
  for n=1:nfeatures   
    corrected_d(feature(n))=-1000000;
  end
  
  [~,indexes]=sort(-corrected_d);
  feature(nfeatures+1) = indexes(1);
  
end

%     [score, cm]=classify(train_data, train_labels,test_data,test_labels,feature);
    