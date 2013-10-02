function projection=project(subimage, meanface, eigenfaces, eigenfacesi, n)
 
% Project `subimage' into the `face space' defined by the first n eigenfaces stored in eigenfaces.

% meanface = the mean face
% eigenfacesi = the inverse eigenface matrix. 
% n = the number of eigenfaces to use to define the face space
  
% Returns: projection = the projected image
  
hh=size(subimage,1);
ww=size(subimage,2);

% Reshape subimage and mean face as vectors
meanface=reshape(meanface,1,hh*ww);
subimage=reshape(subimage,1,hh*ww);
  
% Calculate the difference between subimage and the meanface
deltaface=subimage-meanface;

% Project onto the eigenfaces
w=eigenfaces*deltaface';

% Truncate the eigenvalue matrix
w(n+1:end)=0;

% And project back again
projection=eigenfacesi*w+meanface';

% Reform into a 2-d matrix
projection=reshape(projection,hh,ww);