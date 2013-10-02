function [w, bel] = kmeans (X, w)
% Perform hard kmeans clustering algorithm:  
% X is the set of N l-dimensional data points to be clustered
% w is the initial estimate of the m cluster centers
% returns final cluster centers w, and bel, the cluster index for
% each point
  
  [l, N] = size(X);
  [l, m] = size(w);
  e = 1;
  iter = 0;
  while (e~=0)
    iter = iter+1;
    w_old = w;
    dist_all = [];
    for j = 1:m
      dist = sum(((ones(N,1)*w(:,j)'-X').^2)');
      dist_all = [dist_all; dist];
    end
    [q1, bel] = min(dist_all);
    for j = 1:m
      if (sum(bel==j)~=0)
        w(:,j)=sum(X'.*((bel==j)'*ones(1,l))) / sum(bel==j);
      end
    end
    e = sum(abs(w-w_old));
  end