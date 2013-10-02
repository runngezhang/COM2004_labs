load test_data
clf
f10_2010 =  [310   318   429   436   442   463   525   553   560 644]; % leader until 2011 
f10_2011 = [463 615 460 316 590 310 382 525 367 1] 
f10_2012=[618   590   577   554   496   464   460   442   313    255]; % 98 95.5 Josh  - new leader

f10=f10_2012
fvector  =  zeros(1,900);
fvector(f10)=1;
imagesc(reshape(fvector,30,30))
 
axis([0.5,30,0.5,30])

colormap(1-gray)

 
 print('-dpng','features.png');
 

subplot(2,2,1);
x=test2_data(1,:);
x(f10_2011)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,2);
x=test2_data(2,:);
x(f10_2011)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,3);
x=test2_data(3,:);
x(f10_2011)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,4);
x=test2_data(4,:);
x(f10_2011)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

print('-dpng','features2011.png');


subplot(2,2,1);
x=test2_data(1,:);
x(f10_2010)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,2);
x=test2_data(2,:);
x(f10_2010)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,3);
x=test2_data(3,:);
x(f10_2010)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,4);
x=test2_data(4,:);
x(f10_2010)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)


print('-dpng','features2010.png');



subplot(2,2,1);
x=test2_data(1,:);
x(f10_2012)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,2);
x=test2_data(2,:);
x(f10_2012)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,3);
x=test2_data(3,:);
x(f10_2012)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

subplot(2,2,4);
x=test2_data(4,:);
x(f10_2012)=min(x)/2;
imagesc(reshape(x,30,30))
axis([0.5,30.5,0.5,30.5])
colormap(gray)

print('-dpng','features2012.png');

