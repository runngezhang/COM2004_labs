function d12=multidivergence(class1, class2, features);

% compute mean vectors
mu1 = mean(class1(:,features));
mu2 = mean(class2(:,features));

% compute distance between means
dmu = mu1-mu2;

% compute covariance and inverse covariance matrices
cov1 = cov(class1(:,features));
cov2 = cov(class2(:,features));
icov1 = inv(cov1);
icov2 = inv(cov2);

ndim=length(features);

% plug everything into the formula for multivariate gaussian divergence
d12 = 0.5 * trace(icov1*cov2 + icov2*cov1 - 2*eye(ndim)) + 0.5 * dmu * (icov1 +icov2) * dmu';

