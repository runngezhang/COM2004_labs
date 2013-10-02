function [w,iter,mis_class] = perce(X,y,w_init,rho)

%[w,iter,mis_class] = perce(X,y,w_init,rho)
%  -- basic Perceptron algorithm implemented for the two-class linear
%     classification task
%
%  inputs:
%    lxN matrix X: a set of N (lx1)-column vectors
%    1xN row vector y: i^th element indicates the class (-1 for class 1,
%        or +1 for class 2) where the corresponding vector belongs
%    lx1 column vector w_init: initial weight estimates
%    rho: learning rate
%
%  outputs:
%    lx1 column vector w: estimated parameter vector
%    iter: the number of iterations completed by the algorithm
%    mis_class: the number of misclassified vectors

[l,N] = size(X);
max_iter = 100;
w = w_init;
iter = 0;
mis_class = N;

% repeat the while loop as long as there are misclassified vectors and
% the number of iterations is not more than max_iter
while (mis_class > 0) && (iter < max_iter)
  iter = iter + 1;
  mis_class = 0;
  gradient = zeros(l,1);

  % repeat the for loop for all feature vectors
  for i = 1:N

    % if misclassified vector is found ...
    if ((X(:,i)'*w)*y(i) > 0)
      mis_class = mis_class + 1;

      % accumulate the gradient
      gradient = gradient + y(i)*X(:,i);
    end
  end
  hold off
  scatter(X(1,1:40), X(2,1:40),'r');
  hold on
  scatter(X(1,41:end), X(2,41:end),'b');
  plot(-1:0.1:1,(-1:0.1:1) * -w(2)/w(1) - w(3)/w(1));
  drawnow
  % update the weights
  w = w - rho*gradient;
end
