function reduced_test_data=reduceDim(test_data)
reduced_test_data=doPCA(test_data(1:100,:),50);
reduced_test_data=doPCA(reduced_test_data,10);
end

