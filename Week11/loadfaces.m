% Loads faces from the faces.tif face database image
% Faces are returned as vectors stored in the rows of a matrix. 
%

function faces= loadfaces()
  
% Read in the face data
x=double(imread('faces.tif','tif')');
  
% Width and height of an individual face
width=47;
height=57;

% Cut individual faces from the grid of faces
pixels=(width-1)*(height-1);
faces=zeros(400,pixels);
z=0;
for a=0:19
  for b=0:19
    z=z+1;
    
    % Note that faces on the left of the grid are separated from
    % those on the right by a column of 2 pixels.
    face=x(b*width+1+(b>9):b*width+width-1+(b>9), a*height+1:a*height+height-1)';

    % Reshape the face matrices into vectors and 
    % store the 400 faces as rows of a large matrix
    faces(z,:)=double(reshape(face,1, pixels));
    
  end
   
  % Draw the last face on each row so that the use can see the data
  % loading. (Comment these lines out to speed up the loading).
  imagesc(face);
  drawnow;
  pause
  
end

