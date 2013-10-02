% Loads a PGM image
% Image is returned as a matrix. 
%
function image = loadpgm(file)
% file is the name of a pgm image

fp = fopen(file, 'r');
head = fscanf(fp, '%c%d%d%d%d', 5);
[image,count] = fread(fp, [head(3),head(4)], 'uchar');

fclose(fp);
image = mat2gray(image');

