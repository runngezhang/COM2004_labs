% prepare the data
function [percorr, labels]=classify_loo(wines, selector)

labels = [];


wines=wines(:,[1, selector]);

for n=1:length(wines)
  
  wines_copy=wines;
  wines_test=wines_copy(n,:);
  wines_train=wines_copy;
  wines_train(n,:)=[];
  
  
  wines1_train=wines(wines_train(:,1)==1,:);
  wines2_train=wines(wines_train(:,1)==2,:);
  wines3_train=wines(wines_train(:,1)==3,:);
  
  
  % learn the classifier parameters
  
  mean1 = mean(wines1_train(:,2:end));
  mean2 = mean(wines2_train(:,2:end));
  mean3 = mean(wines3_train(:,2:end));
  
%  var1 = var(wines1_train(:,2:end));
%  var2 = var(wines2_train(:,2:end));
%  var3 = var(wines3_train(:,2:end));
  
  var1 = cov(wines1_train(:,2:end));
  var2 = cov(wines2_train(:,2:end));
  var3 = cov(wines3_train(:,2:end));
  
  % classify the test set
  
  p1=mvnpdf(wines_test(2:end), mean1, var1);
  p2=mvnpdf(wines_test(2:end), mean2, var2);
  p3=mvnpdf(wines_test(2:end), mean3, var3);
  
  p=[p1 p2 p3];

  [~, index] = max(p);
  
  labels = [labels index];
end

percorr = sum(labels' == wines(:,1))/length(labels) * 100;

