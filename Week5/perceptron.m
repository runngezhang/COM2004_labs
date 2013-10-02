function [w,iter,mis_class] = perceptron(X,y,rho, max_iter)

%[w,iter,mis_class] = perce(X,y,w_init,rho)
%  -- basic Perceptron algorithm implemented for the two-class linear
%     classification task
%
%  inputs:
%    Nxl matrix X: a set of N (1xl)-row vectors
%    Nx1 column vector y: i^th element indicates the class (-1 for class 1,
%        or +1 for class 2) where the corresponding vector belongs
%    rho: learning rate
%    max_iter: maximum number of iterations to run before stopping
%
%  outputs:
%    1x(l+1) row vector w: estimated parameter vector - bias term,
%    w_0, storeed in last position
%    iter: the number of iterations completed by the algorithm
%    mis_class: the number of misclassified vectors


% set up and initialize data

% add 1's into the last column of the data matrix, X.
% This allows the equation w'x+w0 to be rewritten as w'x (see
% lecture notes)

[N,l] = size(X);
X = [X, ones(N,1)];
l=l+1;

% initial assumption is that everything is misclassified
mis_class=N;  

% handy to duplicate the labels to make an Nxl matrix
yy=repmat(y, 1, l);

% intialise the weights to some random values
w = randn(1, l);

iter = 0;

% repeat the while loop as long as there are misclassified vectors and
% the number of iterations is not more than max_iter
while (mis_class > 0) && (iter < max_iter)
  iter = iter + 1;
  mc = (((X*w').*y) > 0);
  mis_class=sum(mc);
  w = w - (rho/iter) * sum(yy(mc,:).*X(mc,:));
  fprintf(stderr,'iteration:%d  errros:%d\n',iter, mis_class);
end
