function [w,iter,mis_class] = perce2(X,y,w_init,rho)

[l,N] = size(X);
max_iter = 10000;
w = w_init;
iter = 0;
h=0; h1=0;
data_and_line(X,y,w,iter,h)
mis_class = N;

plot(X(1,y==1), X(2,y==1), 'bo', X(1,y==-1), X(2,y==-1), 'rx');

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
  h=data_and_line(X,y,w,iter,h)
  
  if (h1!=0)
    set(h1,'visible','off');
  end
  h1=text(3,0,['iteration: ',num2str(iter)],'FontSize',16);
%  pause
end
