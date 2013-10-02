function d12=divergence(class1, class2)

% compute a vector of 1-D divergences

% Compute the mean and variance of each vector element
m1 = mean(class1);
m2 = mean(class2);
v1 = var(class1);
v2 = var(class2);

% Plug mean and variances into the formula for 1-D divergence.
% (Note the ./ and .* are being used to compute multiple 1-D
%  divergences without the need for a loop)

d12 = 0.5*(v1./v2 + v2./v1 - 2) + 0.5 * ( m1-m2 ).* (m1-m2) .* (1./v1+1./v2);