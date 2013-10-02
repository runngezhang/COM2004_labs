function pca_axes = computePCAaxes(data)
    
% Performs PCA analysis. 

% The code looks a bit different from the lecture notes because it
% uses a trick that speeds up computation in cases where the number
% of data samples is much less the the dimensionality of the data,
% (ie. as will be the case for the face data used int the lab).

  
% Returns:
%   pca_axes = 
  
ndata = size(data,1);

% Calculate and display the mean face
mean_vector=sum(data)/ndata;

% Calculate the mean normalised data
deltadata=data-repmat(mean_vector, ndata, 1);

% (You'd expect the next line to be deltadata'*deltadata but
% a computational shortcut is being employed...)
u=deltadata*deltadata';

[pc, d]=eig(u);
pc=fliplr(pc);

pca_axes = pc' * deltadata;
