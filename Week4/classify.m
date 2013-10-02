% Sample MATLAB code for the first half of the COM2004/3004 Week4
% lab class
%
% JPB 21/10/2012

% prepare the data
load wines.dat

wines1=wines(wines(:,1)==1,:);
wines2=wines(wines(:,1)==2,:);
wines3=wines(wines(:,1)==3,:);

wines1_test = wines1(1:2:end,:);
wines1_train = wines1(2:2:end,:);

wines2_test = wines2(1:2:end,:);
wines2_train = wines2(2:2:end,:);

wines3_test = wines3(1:2:end,:);
wines3_train = wines3(2:2:end,:);

wines_test=[wines1_test; wines2_test; wines3_test];

% learn the classifier parameters

mean1 = mean(wines1_train(:,2:end));
mean2 = mean(wines2_train(:,2:end));
mean3 = mean(wines3_train(:,2:end));

var1 = cov(wines1_train(:,2:end));
var2 = cov(wines2_train(:,2:end));
var3 = cov(wines3_train(:,2:end));

% classify the test set

p1=mvnpdf(wines_test(:,2:end), mean1, var1);
p2=mvnpdf(wines_test(:,2:end), mean2, var2);
p3=mvnpdf(wines_test(:,2:end), mean3, var3);

p=[p1 p2 p3];

% index of the column with high p value is the predicted class label

[~, index] = max(p,[],2);

% compared predicted class labels in index with the true labels in
% wines_test

percorr = sum(index == wines_test(:,1))/length(p) * 100;

plot(index)
fprintf(stderr,'Percentage correct is %f\n',percorr);