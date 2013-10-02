function [meanx, varx] = compute_mean_and_variance(px, l, u, n) 

xpx = @(x) x.*px(x);
xxpx = @(x) x.^2.*px(x);

ex = integrate(xpx,l,u,n);
ex2 = integrate(xxpx,l,u,n);

meanx = ex;
varx = ex2 - ex*ex;


