function [pca_axes, mean_vector] = learnPCA(data, N)

% Performs PCA dimensionality reduction of 'data' reducing down to
% N dimensions.
% Returns:
% x - dimensionally reduced data
% v - the PCA axes (which may be useful)


% Compute PCA axes (i.e. PCA axes)
pca_axes = computePCAaxes(data);

% Select 1st N PCA axes
pca_axes = pca_axes(1:N,:);


% compute the mean vector 
mean_vector=mean(data);


