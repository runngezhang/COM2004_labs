for i=1:100000;
  fprintf("%d \r",i);
  feat=floor(rand(1,10)*900)+1;
  score = classify (train_data, train_labels, test2_data, test2_labels, feat);
  scores(i)=score;
end
