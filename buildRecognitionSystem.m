function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('C:/Users/sarim/Documents/hw1/release/data/dictionary.mat');
	load('C:/Users/sarim/Documents/hw1/release/data/traintest.mat');
    dictionarySize = size(dictionary, 1);
    interval= 1;
	train_imagenames = train_imagenames(1:interval:end);
    h = [];
    hist = [];
    
    imPaths = strcat(['C:/Users/sarim/Documents/hw1/release/data/'], train_imagenames);
    numImages = size(imPaths);
    train_features = [];
    for i = 1:numImages
        imPaths(i) = strrep(imPaths(i), '.jpg', '.mat');
    end
    
    for i = 1:numImages
        filename = string(imPaths(i));
        wordMap = importdata(filename);
        hist = getImageFeaturesSPM(wordMap, dictionarySize); %hard-coded layerNum, hence omitted from function call
        h = cat(2, h, hist);
        
    end
    train_features = h;
    train_labels = train_labels';
    
        

	% TODO create train_features


	save('C:/Users/sarim/Desktop/vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end