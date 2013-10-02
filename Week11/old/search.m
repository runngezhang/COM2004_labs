function DFFS_map = search(scene, meanface, eigenfaces, eigenfacesi, subspace_size)

% Version 4
  
% Returns the DFFS_map - the Distance From Face Space map i.e. the
% distance computed for subimages at each position in the scene
   
% The function should be supplied with:
%    scene - the image to be searched
%    meanface - the mean face
%    eigenfaces - the set of eigenfaces
%    eigenfacesi - the inverse eigenface matrix
%    subspace_size - the number of eigenvectors on which to
%    construct 'face space'. 

  
colormap(gray);

xstep=1;  % subimage step size in the x direction.
ystep=1;  % subimage step size in the y direction.

face_height=size(meanface,1);
face_width=size(meanface,2);

scene_height=size(scene,1);
scene_width=size(scene,2);

columns=floor((scene_width-face_width)/xstep);
rows=floor((scene_height-face_height)/ystep);
DFFS_map=zeros(columns, rows)-400;

xpos=1;

for x=1:xstep:scene_width-face_width;
  ypos=1;
  for y=1:ystep:scene_height-face_height;
    subimage=scene(floor(y):floor(y)+face_height-1, floor(x):floor(x)+face_width-1);
    
    projection=project(subimage, meanface, eigenfaces, eigenfacesi, subspace_size);

    dist=distance(subimage, projection);
    
%    if (y==1 && x==1) 
    if (y==1 & x==1)   
      DFFS_map(:,:)=dist;
    else
      DFFS_map(xpos, ypos)=dist;
    end
    
    %% Note: Removing the next 4 lines will speed up the search!
    subplot(1,3,1); imagesc(subimage);
    subplot(1,3,2); imagesc(projection);
    subplot(1,3,3); imagesc(-DFFS_map');
    drawnow;

    ypos=ypos+1;
  end

  xpos=xpos+1;
end
