function [w, bel] = kmeans (X, w, do_plot)
% Perform hard kmeans clustering algorithm:  
% X is the set of N l-dimensional data points to be clustered
% w is the initial estimate of the m cluster centres
% if do_plot is set to 1 or true then an animated scatter plot is produced
% returns final cluster centers w, and bel, the cluster index for
% each point

% If do_plot argument not supplied then default to false
if (nargin==2) do_plot=false; end;

[l, N] = size(X);
[l, m] = size(w);
e = 1;   % measures cluster centre movement
iter = 0;  % for counting the iterations

% iterate until the cluster centres stop moving
while (e~=0) 
  iter = iter+1;
  w_old = w;
  dist_all = [];
  % compute distances from points to cluster centres
  for j = 1:m
    dist = sum(((ones(N,1)*w(:,j)'-X').^2)');
    dist_all = [dist_all; dist];
  end
  % find closest cluster for each point
  [dummy, bel] = min(dist_all);
  
  % compute new cluster centres (ignore clusters with no points)
  hold off
  for j = 1:m
    if (sum(bel==j)~=0)	
      w(:,j)=sum(X'.*((bel==j)'*ones(1,l))) / sum(bel==j);
      if (do_plot) 
	plotCluster(X(:,bel==j),w(:,j),j); 
      end
    end
  end
  if (do_plot) 
    disp('Press a key to contiue');
    pause; 
  end;
  
  % compute the distance the cluster centres have moved
  e = sum(sum(abs(w-w_old)));
end
  

% Function for plotting cluster points and cluster centre
% Cluster points are plotted in one of 7 possible colours  
function plotCluster(X,center,colour_code)
  colours = 'gbrkcmy';
  colour = colours(mod(colour_code,length(colours))+1);
  scatter(X(1,:), X(2,:), colour);
  hold on
  scatter(center(1), center(2), 'xk');
  
