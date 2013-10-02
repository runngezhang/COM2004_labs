function run_perceptron(N,xsep, ysep, rho)

setenv("GNUTERM", "x11");

[X,y] = generate_data(N,2,xsep, ysep);

class1=X(:,X(3,:)==1);
class2=X(:,X(3,:)==-1);

scatter(class1(1,:), class1(2,:),'r');
hold on
scatter(class2(1,:), class2(2,:),'b');
hold off

[w,iter,mis_class] = perce2(X,y,[1 1 -0.5]',rho)
