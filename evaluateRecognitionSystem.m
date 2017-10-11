function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('C:/Users/sarim/Desktop/vision.mat');
	load('C:/Users/sarim/Documents/hw1/release/data/traintest.mat');
    interval= 1;
	test_imagenames = test_imagenames(1:interval:end);
    test_labels = test_labels;
    timPaths = strcat(['C:/Users/sarim/Documents/hw1/release/data/'], test_imagenames);
    numTImages = size(timPaths);
    conf = [];
    for i = 1:numTImages
        ipath = char(timPaths(i));
        guessedImage = guessImage(ipath);
        test_label_val = test_labels(i);
        train_label_val = find(ismember(mapping,guessedImage));
        conf(test_label_val, train_label_val) = conf(test_label_val, train_label_val) + 1;
    end
    

	% TODO Implement your code here

end