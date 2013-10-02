function h=data_and_line(X,y,w,iter,h)

if h!=0
  set(h,'visible','off');
end

%plot(X(1,y==1), X(2,y==1), 'bo', X(1,y==-1), X(2,y==-1), 'rx')
axis equal, axis([-0.5 5.5 -0.5 5.5])
hold on
x1 = [0 5];
x2 = -(w(1)*x1+w(3))/w(2);
h=plot(x1,x2);
drawnow
%pause(0.2)
hold off
