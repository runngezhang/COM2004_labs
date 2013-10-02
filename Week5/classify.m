load abalone.dat

abalone1=abalone(abalone(:,1)==1,:);
abalone2=abalone(abalone(:,1)==2,:);

abalone1_train = abalone1(1:2:end,2:end);
abalone2_train= abalone2(1:2:end,2:end);

abalone1_test = abalone1(2:2:end,:);
abalone2_test = abalone2(2:2:end,:);

abalone_test =[abalone1_test; abalone2_test];

mean1=mean(abalone1_train);
mean2=mean(abalone2_train);

cov1=cov(abalone1_train);
cov2=cov(abalone2_train);


p1 = mvnpdf(abalone_test(:,2:end), mean1, cov1);
p2 = mvnpdf(abalone_test(:,2:end), mean2, cov2);


label=(p2>p1)+1;


abalone_train=[abalone1_train; abalone2_train];

classes = [-ones(length(abalone1_train),1); ones(length(abalone2_train),1)];