function reduced_data = reducePCA(data, pca_axes, mean_vector)

% Performs PCA dimensionality reduction

% subtract mean from all data points
centered= data-repmat(mean_vector, size(data,1), 1);

% project points onto PCA axes
reduced_data = centered * pca_axes';
