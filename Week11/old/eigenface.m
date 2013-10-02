
function [efaces, efacesi]=eigenface(faces, nfaces)
    
% Constructs Eigen faces using the method of Turk and Pentland
% faces = data returned by 'loadfaces'
% nfaces = number of faces from training data to emplay (1 to 400)
  
% Returns:
%   efaces = nfaces eigenfaces
%   efacesi = the inverse eigenface matrix
  
faces=faces(1:nfaces,:);

% Calculate and display the mean face
meanface=sum(faces)/nfaces;
imagesc(reshape(meanface,56,46)); 

% Calculate the mean normalised faces
deltafaces=faces;
for i=1:nfaces
  deltafaces(i,:)=faces(i,:)-meanface;
end
imagesc(reshape(deltafaces(1,:),56,46)); 


% Calculate the eigen faces using the efficient Turk and Pentland technique
u=deltafaces*deltafaces';

[pc, d]=eig(u);
pc=fliplr(pc);

efaces = pc' * deltafaces;

% Calculate the inverse eigenface matrix
efacesi=pinv(efaces);