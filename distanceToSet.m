function histInter = distanceToSet(wordHist, histograms)
% Compute distance between a histogram of visual words with all training image histograms.
% Inputs:
% 	wordHist: visual word histogram - K * (4^(L+1) − 1 / 3) × 1 vector
% 	histograms: matrix containing T features from T training images - K * (4^(L+1) − 1 / 3) × T matrix
% Output:
% 	histInter: histogram intersection similarity between wordHist and each training sample as a 1 × T vector

	% TODO Implement your code here
	y = size(histograms, 2);
    wordHist = repmat(wordHist, [1, y]); %creating y columns equal to number of columns in histograms
    compHist = min(wordHist, histograms); %finding min for each matrix element
    minsum = sum(compHist, 1); %finding sum of each column
    histInter = minsum;
end