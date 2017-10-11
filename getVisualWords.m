function [wordMap] = getVisualWords(img, filterBank, dictionary)
    isize = size(img);
    
    filterResponses = extractFilterResponses(img, filterBank); 
    frsize = size(filterResponses);
    filterReshaped = reshape(filterResponses, [frsize(1)*frsize(2), frsize(3)]);
    dis = pdist2(filterReshaped, dictionary);
    wordMap = zeros(size(filterReshaped, 1), 1);
    
    for i = 1:size(dis, 1)
        [~, wordMap(i, :)] = min(dis(i, :)); %populating wordMap array of the size (dis x 1)
    end
    
    wordMap = reshape(wordMap, [isize(1), isize(2)]); %reshaping wordMap array into the dimensions of image
        
    
end
