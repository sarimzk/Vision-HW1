
function filterResponses = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
    if size(img, 3) == 1
        img = repmat(img, [1, 1, 3]);
    end
	img = im2double(img);
    red = img(:, :, 1);
    green = img(:, :, 2);
    blue = img(:, :, 3);
	[L, a, b] = RGB2Lab(red, green, blue);
    filterResponses = zeros(size(img, 1), size(img, 2), 60);
    i = 1;
    n = 1;
    for i = 1:20
        filterL = imfilter(L, filterBank{i});
        filtera = imfilter(a, filterBank{i});
        filterb = imfilter(b, filterBank{i});
        
        filterResponses(:, :, 3*i-2) = filterL;
        filterResponses(:, :, 3*i-1) = filtera;
        filterResponses(:, :, 3*i) = filterb;
    end
end
