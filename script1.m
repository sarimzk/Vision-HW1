% Q.1.1 script

img1 = imread('test.jpg');

filterBank = createFilterBank();

filterResponses = extractFilterResponses(img1, filterBank);

montage(filterResponses, 'size', [4 5]);



