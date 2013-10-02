function meanx = compute_mean(px, l, u, n) 

xpx = @(x) x.*px(x);

meanx = integrate(xpx,l,u,n);

