function [x,v] = doPCA(data, N)

% compute data covariance matrix
covx = cov(data);

% compute first N pca axes
[v,d] = eig(covx);
v=fliplr(v);
v=v(:,1:N);

% compute the mean vector 
datamean=mean(data);

% subtract mean from all data points
centered= data-repmat(datamean, size(data,1), 1);

% project points onto PCA axes
x = centered * v;

