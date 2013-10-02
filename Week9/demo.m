% Demo of how to run and evaluate a clustering

% load lab data
load lab9_data;

%%%%%%%%%%%%%%%% RUN 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

% Perform clustering of 1st 100 images into 26 classes
fprintf('Clustering using all 900 dimensions\n');
c=cluster(test_data(1:100,:), 26,  '@(x,y)dm_cc_mean(x,y,@dm_pp_negative_cosine)', '@display_images');

% Evaluate clustering.  Should produce a score of 58% correct.
score = evaluateClustering(c, test_labels);
fprintf('Score is %3.2f percent correct\n',score);


%%%%%%%%%%%%%%% RUN 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Dimensionality reduction. 
% Super dumb feature selection: just takes first 10 features 
%  --- will score just 25% correct.

fprintf('Clustering again using 10 poorly chosen dimensions\n');
test_data10 = test_data(1:100, 1:10);

% Recluster and then rescore. Should now get a score of just correct.
% (Note that the @display_points display option is chosen as
% @display_images only works for 900-dimensional data)

c=cluster(test_data10, 26,  '@(x,y)dm_cc_mean(x,y,@dm_pp_negative_cosine)', '@display_points');
score = evaluateClustering(c, test_labels);
fprintf('Score is %3.2f percent correct\n',score);
