function dist=distance(v1, v2)
    height=size(v1,1);
    width=size(v1,2);
    v1=reshape(v1,1,width*height);
    v2=reshape(v2,1,width*height);
    diff=v1-v2;
    dist=sqrt(sum(diff.*diff));
