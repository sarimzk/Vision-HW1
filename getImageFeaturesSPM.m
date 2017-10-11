function [h] = getImageFeaturesSPM(wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    
    % hard-coded layerNum to 3 instead of using a variable
    L = 2;
    x = size(wordMap, 1);
    y = size(wordMap, 2);
    %layer2
    modValx = mod(x, 4);
    modValy = mod(y, 4);
    if modValx == 3
        padx = 1;
    elseif modValx == 1
        padx = 3;
    else
        padx = 2;
    end
    if modValy == 3
        pady = 1;
    elseif modValy == 1
        pady = 3;
    else
        pady = 2;
    end
    %padding along the x-axis
    if modValx ~= 0
        wordMap = padarray(wordMap,[padx, 0], 'post');
    end
    %padding along y axis
    if modValy ~= 0
        wordMap = padarray(wordMap,[0, pady], 'post');
    end
    xdiv = size(wordMap, 1)/4;
    ydiv = size(wordMap, 2)/4;
    wordCell2 = mat2cell(wordMap, [xdiv, xdiv, xdiv, xdiv], [ydiv, ydiv, ydiv, ydiv]); %dividing into cells for layer 2
    h2 = [];
    for i = 1:4
        for j = 1:4
            hgram = hist(wordCell2{i, j}, 150);
            hgram = hgram/sum(hgram);
            assert(numel(hgram) == dictionarySize);
            h2 = cat(1, h2, hgram);
        end
    end
    h2 = 0.5*h2;
    
    %layer1
    
    xdiv = size(wordMap, 1)/2;
    ydiv = size(wordMap, 2)/2;
    wordCell1 = mat2cell(wordMap, [xdiv, xdiv], [ydiv, ydiv]); %dividing into cells for layer 1
    h1 = [];
    for i = 1:2
        for j = 1:2
            hgram = hist(wordCell1{i, j}, 150);
            hgram = hgram/sum(hgram);
            assert(numel(hgram) == dictionarySize);
            h1 = cat(1, h1, hgram);
        end
    end
    h1 = 0.25*h1;
    
    %layer0
    h0 = hist(wordMap, 150);
    h0 = h0/sum(h0);
    assert(numel(hgram) == dictionarySize);
    h0 = 0.25*h0;
    
    h = cat(1, h2, h1, h0);
end
           
       
    
        
        

