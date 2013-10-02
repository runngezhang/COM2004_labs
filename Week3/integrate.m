function a = integrate(f, l, u, N)

y=linspace(l,u,N);
y=y(1:end-1);

a = sum(f(y))*(u-l)/N;