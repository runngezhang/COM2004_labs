function newData = challenge(data)
nrs = [644   318   463   553   560   436   525];

dataSize = size(data, 1);
sizeNR = size(nrs,2);

% Apply threshold
% If one number is bigger than the mean value, put 1, otherwise 0
threshold_test = zeros(dataSize, 900);
for j = 1 : dataSize
    tst = data(j, :);
    avg = mean(tst);
    for i = 1 : 900
        if (tst(1, i) > avg)
            tst(1, i) = 1;
        else tst(1, i) = 0;
        end
    end
    threshold_test(j, :) = tst;
end


% Crop the data into a 400x400 image
crop_test = zeros(dataSize, 400);
for i = 1 : dataSize
    aux = reshape(data(i, :), 30, 30);
    aux = aux(7 : 26, 7 : 26);
    crop_test(i, :) = reshape(aux, 1, 400);
end

% Calculate PCA
pca_data = doPCA(crop_test, 10 - sizeNR + 1);
% Use 7 features from the first challenge
newData = threshold_test(:, nrs);
% The rest of 3, take from the PCA
newData = [newData pca_data(:, 2 : (10 - sizeNR + 1))];

end

