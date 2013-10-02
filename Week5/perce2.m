function [w,iter,mis_class] = perce2(X,y,w_init,rho)

[l,N] = size(X);
max_iter = 10000;
w = w_init;
iter = 0;
data_and_line(X,y,w,iter)
mis_class = N;
while (mis_class > 0) && (iter < max_iter)
  iter = iter + 1;
  mis_class = 0;
  gradient = zeros(l,1);
  for i = 1:N
    if ((X(:,i)'*w)*y(i) > 0)
      mis_class = mis_class + 1;
      gradient = gradient + y(i)*X(:,i);
    end
  end
  w = w - rho*gradient;
  data_and_line(X,y,w,iter)
end
