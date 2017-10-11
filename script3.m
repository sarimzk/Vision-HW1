% Q.2.1 script

wordMap = importdata('C:/Users/sarim/Documents/hw1/release/data/sun_bdkwweprgeumpslv.mat');
dictionaryS = importdata('C:/Users/sarim/Documents/hw1/release/data/dictionary.mat');
dictionary = dictionaryS.dictionary
dictionarySize = size(dictionary, 1);
h = getImageFeaturesSPM(wordMap, dictionarySize);
