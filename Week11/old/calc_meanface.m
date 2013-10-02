function meanface=calc_meanface(faces, nfaces)
  % faces = date returned by 'loadfaces'
  % nfaces = number of faces to employ
  meanface_vector=mean(faces(1:nfaces,:));
  meanface=reshape(meanface_vector,56,46);
 