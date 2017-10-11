function [filterBank,dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.
    T = []; 
    filteredResponses = [];
    filterBank  = createFilterBank();
    num_Images = size(imPaths);    

    

    at = 0;
    for i = 1:num_Images
        filename = char(imPaths(i));    
        info = imfinfo(filename);    
        img = imread(filename,info.Format);
        [x y z] = size(img);

        filteredResponse = extractFilterResponses(img, filterBank);

        alpha = 20;

        [row, col, wid] = size(filteredResponse);
    
        new = [];
        for i=1:alpha   
            rand_new = filteredResponse(randi(row), randi(col), 1:60);
            new = [new, rand_new];
            at = at + 1;
        end
        filteredResponses = [filteredResponses, new];
    end
    
    filteredResponses = reshape(filteredResponses,[at, 60]);
        
    [~,dictionary] = kmeans(filteredResponses, 100);
end
